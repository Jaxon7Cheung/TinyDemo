//
//  ViewController.m
//  RunLoop&NSTimer
//
//  Created by 张旭洋 on 2024/8/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextView* textView = [[UITextView alloc] initWithFrame: CGRectMake(77, 77, 97, 87)];
    textView.backgroundColor = [UIColor cyanColor];
    textView.text = @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
    [self.view addSubview: textView];
    
    static int count = 0;
//    [NSTimer scheduledTimerWithTimeInterval: 1.0 repeats: YES block:^(NSTimer * _Nonnull timer) {
//       NSLog(@"%d", ++count);
//    }];
    // 该方法创建的NSTimer，一旦开始滑动textView，RunLoop就会只处理UITrackingRunLoopMode下的事件，NSTimer就会失效，停止打印count
    // NSTimer是在NSDefaultRunLoopMode下进行的
    
    // 解决办法如下：
    NSTimer* timer = [NSTimer timerWithTimeInterval: 1.0 repeats: YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%d", ++count);
    }]; // 仅仅返回了一个定时器
//    CFRunLoopAddTimer(<#CFRunLoopRef rl#>, <#CFRunLoopTimerRef timer#>, <#CFRunLoopMode mode#>);
//    [[NSRunLoop currentRunLoop] addTimer: timer forMode: NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] addTimer: timer forMode: UITrackingRunLoopMode];
    
    // NSRunLoopCommonModes并不是真的模式，而是一种标记，会让定时器同时能在这两种模式下都进行工作
    [[NSRunLoop currentRunLoop] addTimer: timer forMode: NSRunLoopCommonModes];
    // 让两种模式下都能处理NSTimer事件
    /*
     选择通用模式会将这两种模式都添加到RunLoop底层__CFRunLoop结构体里的_commonModes成员变量里，_commonModes意味着在通用模式下可以执行的模式列表，而定时器timer也会被加入到_commonModeItems列表中；没有设置为通用模式的定时器timer只存在于__CFRunLoopMode里面的成员变量timers这个列表中
     */
    // 能同时在commonModes里工作的东西，都会放到commonModeItems里去
    
    
}


@end
