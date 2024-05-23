//
//  ViewController.m
//  AVFoundationTest
//
//  Created by 张旭洋 on 2024/3/6.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"

@interface ViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>

@property (nonatomic, strong)AVCaptureSession* captureSession;
@property (nonatomic, strong)AVCaptureVideoPreviewLayer *previewLayer;

@property (nonatomic, strong)UIView* colorView;

@property (nonatomic, strong) UIButton *cameraToggleButton;
@property (nonatomic, assign) AVCaptureDevicePosition currentCameraPosition;

@property (nonatomic, strong)UISlider *zoomSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.captureSession = [[AVCaptureSession alloc] init];
    
    AVCaptureDevice* videoDevice = [AVCaptureDevice defaultDeviceWithMediaType: AVMediaTypeVideo];
    NSError* error = nil;
    AVCaptureDeviceInput* videoInput = [AVCaptureDeviceInput deviceInputWithDevice: videoDevice error: &error];
    [self.captureSession addInput: videoInput];
    
    AVCaptureVideoDataOutput* videoOutput = [[AVCaptureVideoDataOutput alloc] init];
    videoOutput.videoSettings = @{(id)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA)};
    [videoOutput setSampleBufferDelegate: self queue: dispatch_get_main_queue()];
    [self.captureSession addOutput: videoOutput];
    
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession: self.captureSession];
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.previewLayer.frame = self.view.bounds;
    [self.view.layer addSublayer: self.previewLayer];
    
    
    
    UIView* centerPoint = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 7, 7)];
    centerPoint.center = self.view.center;
    centerPoint.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: centerPoint];
    
    self.colorView = [[UIView alloc] initWithFrame: CGRectMake(10, 10, 137, 137)];
    [self.view addSubview: self.colorView];
    
    [self.captureSession startRunning];
    
    self.cameraToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 150, 50)];
    [self.cameraToggleButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.cameraToggleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cameraToggleButton addTarget:self action:@selector(toggleCameraPosition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cameraToggleButton];
    
    self.zoomSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.colorView.frame) + 20, CGRectGetWidth(self.view.frame) - 40, 20)];
    [self.zoomSlider addTarget:self action:@selector(zoomSliderChanged:) forControlEvents:UIControlEventValueChanged];
    self.zoomSlider.minimumValue = 1.0;
    self.zoomSlider.maximumValue = videoDevice.activeFormat.videoMaxZoomFactor;
    [self.view addSubview:self.zoomSlider];
}

// 视频数据输出的代理方法
- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    // 获取视频帧的图像数据
    CVPixelBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    
    // 锁定像素缓冲区的基地址
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    
    // 获取像素缓冲区的基地址和大小
    uint8_t* baseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
    size_t width = CVPixelBufferGetWidth(pixelBuffer);
    size_t height = CVPixelBufferGetHeight(pixelBuffer);
    
    // 计算中心点像素位置
    NSUInteger x = width / 2;
    NSUInteger y = height / 2;
    NSUInteger byteIndex = 4 * (width * y + x);
    
    // 获取中心点的 RGB 颜色信息
    UInt8 blue = baseAddress[byteIndex];
    UInt8 green = baseAddress[byteIndex + 1];
    UInt8 red = baseAddress[byteIndex + 2];
    
    // 解锁像素缓冲区的基地址
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    
    NSLog(@"Center RGB Color - Red: %d, Green: %d, Blue: %d", red, green, blue);
    
    // 在这里可以将 RGB 颜色信息用途你需要的方式进行处理
    
    self.colorView.backgroundColor = [UIColor colorWithRed: red / 255.0 green: green / 255.0 blue: blue / 255.0 alpha: 1.0];
}

- (void)toggleCameraPosition {
    // 寻找要切换到的摄像头位置
    AVCaptureDevicePosition desiredPosition;
    if (self.currentCameraPosition == AVCaptureDevicePositionBack) {
        desiredPosition = AVCaptureDevicePositionFront;
        [self.cameraToggleButton setTitle:@"Front" forState: UIControlStateNormal];
    } else {
        desiredPosition = AVCaptureDevicePositionBack;
        [self.cameraToggleButton setTitle:@"Back" forState: UIControlStateNormal];
    }

    // 查找拥有所需位置的AVCaptureDevice并切换到该位置
    NSArray<AVCaptureDeviceType> *deviceTypes = @[AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeBuiltInTelephotoCamera];
    AVCaptureDeviceDiscoverySession *discoverySession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:deviceTypes mediaType:AVMediaTypeVideo position:desiredPosition];

    for (AVCaptureDevice *device in discoverySession.devices) {
        NSError *error;
        AVCaptureDeviceInput *newVideoInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];

        if (newVideoInput) {
            [self.captureSession beginConfiguration];
            // 移除现有的输入
            for (AVCaptureInput *input in self.captureSession.inputs) {
                [self.captureSession removeInput:input];
            }
            // 添加新的输入
            [self.captureSession addInput:newVideoInput];
            [self.captureSession commitConfiguration];
            self.currentCameraPosition = desiredPosition;
            break;
        } else {
            NSLog(@"创建AVCaptureDeviceInput时出错: %@", error.localizedDescription);
        }
    }
}

- (void)zoomSliderChanged:(UISlider *)slider {
//    CGFloat scale = 0.0;
//    if (slider.value > 27) {
//        scale = slider.value;
//    } else {
//        scale = slider.value / 10;
//    }
    CGFloat scale = slider.value;
    // 使用affineTransform来实现预览图像的缩放
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    self.previewLayer.affineTransform = transform;
}

@end
