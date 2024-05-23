//
//  PickingColorModel.m
//  AVFoundationTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import "PickingColorModel.h"
#import <AVFoundation/AVFoundation.h>

@implementation PickingColorModel

- (instancetype)initWithDelegate: (id)delegate {
    self = [super init];
    if (self) {

        [self initSessionModelWithDelegate: delegate];
        
    }
    return self;
}

- (void)initSessionModelWithDelegate: (id)delegate {
    self.captureSession = [[AVCaptureSession alloc] init];
    self.captureSession.sessionPreset = AVCaptureSessionPresetHigh;
    
    AVCaptureDevice* videoDevice = [AVCaptureDevice defaultDeviceWithMediaType: AVMediaTypeVideo];
    NSError* error = nil;
    AVCaptureDeviceInput* videoInput = [AVCaptureDeviceInput deviceInputWithDevice: videoDevice error: &error];
    if (videoInput) {
        if ([self.captureSession canAddInput: videoInput]) {
            [self.captureSession addInput: videoInput];
            
            AVCaptureVideoDataOutput* videoOutput = [[AVCaptureVideoDataOutput alloc] init];
            videoOutput.videoSettings = @{(id)kCVPixelBufferPixelFormatTypeKey : @(kCVPixelFormatType_32BGRA)};
            [videoOutput setSampleBufferDelegate: delegate queue: dispatch_get_main_queue()];
            if ([self.captureSession canAddOutput: videoOutput]) {
                [self.captureSession addOutput: videoOutput];
            }
        }
    } else {
        NSLog(@"创建AVCaptureDeviceInput时出错: %@", error.localizedDescription);
    }
}

- (void)startCaptureSession {
    [self.captureSession startRunning];
}

- (void)stopCaptureSession {
    [self.captureSession stopRunning];
}
    
- (void)toggleCameraPosition {
    // 寻找要切换到的摄像头位置
    AVCaptureDevicePosition desiredPosition;
//    AVCaptureDevicePosition desiredPosition;
    if (self.currentCameraPosition == AVCaptureDevicePositionBack) {
        desiredPosition = AVCaptureDevicePositionFront;
//        [cameraToggleButton setTitle: @"Front" forState: UIControlStateNormal];
    } else if (self.currentCameraPosition == AVCaptureDevicePositionFront) {
        desiredPosition = AVCaptureDevicePositionBack;
//        [cameraToggleButton setTitle: @"Back" forState: UIControlStateNormal];
    } else {
        desiredPosition = AVCaptureDevicePositionBack;
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

    
//- (void)setZoomFactor: (CGFloat)zoomFactor {
//    
//}

@end
