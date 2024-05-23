//
//  PickingColorModel.h
//  AVFoundationTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AVCaptureSession;
//typedef NSInteger AVCaptureDevicePosition;
typedef NS_ENUM(NSInteger, AVCaptureDevicePosition);

@interface PickingColorModel : NSObject

@property (nonatomic, strong)AVCaptureSession* captureSession;
@property (nonatomic, assign)AVCaptureDevicePosition currentCameraPosition;
@property (nonatomic, assign)CGFloat currentZoomFactor;

- (instancetype)initWithDelegate: (id)delegate;
- (void)startCaptureSession;
- (void)stopCaptureSession;
- (void)toggleCameraPosition;
//- (void)setZoomFactor: (CGFloat)zoomFactor;

@end

NS_ASSUME_NONNULL_END
