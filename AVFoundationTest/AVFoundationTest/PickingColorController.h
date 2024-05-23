//
//  PickingColorController.h
//  AVFoundationTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PickingColorView;
@class PickingColorModel;

@interface PickingColorController : UIViewController

@property (nonatomic, strong)PickingColorView* pickingColorView;
@property (nonatomic, strong)PickingColorModel* pickingColorModel;

@end

NS_ASSUME_NONNULL_END
