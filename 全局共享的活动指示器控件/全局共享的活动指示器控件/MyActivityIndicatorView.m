//
//  MyActivityIndicatorView.m
//  全局共享的活动指示器控件
//
//  Created by 张旭洋 on 2024/1/29.
//

#import "MyActivityIndicatorView.h"

@implementation OverallActivityIndicatorView

+ (OverallActivityIndicatorView *)sharedMyActivityIndicatorView {
    //设置单例方法
    static OverallActivityIndicatorView* myActivityIndicatorView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myActivityIndicatorView = [[OverallActivityIndicatorView alloc] init];
    });
    return myActivityIndicatorView;
}

- (instancetype)init {
    self  = [super init];
    if (self) {
        //视图的初始化
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha: 0.3];
        
        //标签的初始化
        self.titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, self.frame.size.height / 2 + 20, self.frame.size.width, 30)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: self.titleLabel];
        
        //指示器的初始化
        UIActivityIndicatorView* indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleLarge];
        indicatorView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        [indicatorView startAnimating];
        [self addSubview: indicatorView];
        
        UILongPressGestureRecognizer* longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector(pressLong)];
        [self addGestureRecognizer: longPressGesture];
    }
    
    return self;
}

+ (void)startActivity {
    //安全判断，确认指示器控件当前不在展示状态
    if ([OverallActivityIndicatorView sharedMyActivityIndicatorView].show) return;
    
    //将指示器添加到应用的window上
    [[UIApplication sharedApplication].keyWindow addSubview: [OverallActivityIndicatorView sharedMyActivityIndicatorView]];
    
    //更新指示器状态
    [OverallActivityIndicatorView sharedMyActivityIndicatorView].show = YES;;
}

+ (void)stopActivity {
    if ([OverallActivityIndicatorView sharedMyActivityIndicatorView].show) {
        //将指示器视图从其父视图上移除
        [[OverallActivityIndicatorView sharedMyActivityIndicatorView] removeFromSuperview];
    }
    
    //更新指示器状态
    [OverallActivityIndicatorView sharedMyActivityIndicatorView].show = NO;
}

+ (void)setText:(NSString *)text {
    [OverallActivityIndicatorView sharedMyActivityIndicatorView].titleLabel.text = text;
}

- (void)pressLong {
    [OverallActivityIndicatorView stopActivity];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
