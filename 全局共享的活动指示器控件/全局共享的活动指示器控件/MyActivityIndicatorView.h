//
//  MyActivityIndicatorView.h
//  全局共享的活动指示器控件
//
//  Created by 张旭洋 on 2024/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OverallActivityIndicatorView : UIView

@property (nonatomic, strong)UILabel* titleLabel;
@property (nonatomic, assign)BOOL show;

//获取单例对象
+ (OverallActivityIndicatorView *)sharedMyActivityIndicatorView;

//开始展示活动指示器
+ (void)startActivity;
//停止展示活动指示器
+ (void)stopActivity;

//设置活动展示器的提示文案
+ (void)setText: (NSString *)text;

@end



NS_ASSUME_NONNULL_END
