//
//  PickingColorView.m
//  AVFoundationTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import "PickingColorView.h"
#import "AVFoundation/AVFoundation.h"

@implementation PickingColorView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame: frame];
//    if (self) {
//        [self setUI: captureSession];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame andCaptureSession:(id)captureSession {
    self = [super initWithFrame: frame];
    if (self) {
        [self setUI: captureSession];
    }
    return self;
}

- (void)setUI: (id)captureSession {
    //实时相机
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession: captureSession];
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.previewLayer.frame = self.bounds;
    [self.layer addSublayer: self.previewLayer];
    
    UIView* centerPoint = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 7, 7)];
    centerPoint.center = self.center;
    centerPoint.backgroundColor = [UIColor whiteColor];
    [self addSubview: centerPoint];
    
    self.colorView = [[UIView alloc] initWithFrame: CGRectMake(10, 10, 137, 137)];
    [self addSubview: self.colorView];
    
    self.toggleCameraPosition = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.toggleCameraPosition setTitle: @"Back" forState: UIControlStateNormal];
    [self.toggleCameraPosition addTarget: self action: @selector(toggleCameraPosition:) forControlEvents: UIControlEventTouchUpInside];
    
    
//    self.cameraToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 250, 250)];
//    [self.cameraToggleButton setTitle:@"Back" forState:UIControlStateNormal];
//    [self.cameraToggleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.cameraToggleButton addTarget:self action:@selector(toggleCameraPosition) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.cameraToggleButton];
}

- (void)toggleCameraPosition: (UIButton *)button {
    [self.delegate toggleCameraPosition];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
