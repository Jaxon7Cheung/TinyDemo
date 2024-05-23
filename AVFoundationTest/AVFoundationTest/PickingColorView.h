//
//  PickingColorView.h
//  AVFoundationTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import <UIKit/UIKit.h>

@class AVCaptureVideoPreviewLayer;

NS_ASSUME_NONNULL_BEGIN

@protocol ToggleButtonDelegate <NSObject>

- (void)toggleCameraPosition;

@end

@interface PickingColorView : UIView

@property (nonatomic, strong)AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong)UIView* colorView;

@property (nonatomic, weak)id<ToggleButtonDelegate>delegate;
@property (nonatomic, strong)UIButton* toggleCameraPosition;

- (instancetype)initWithFrame: (CGRect)frame andCaptureSession: (id)captureSession;

@end

NS_ASSUME_NONNULL_END
