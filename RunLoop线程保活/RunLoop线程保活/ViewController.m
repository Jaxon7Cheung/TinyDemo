//
//  ViewController.m
//  RunLoop线程保活
//
//  Created by 张旭洋 on 2024/8/25.
//

#import "ViewController.h"

@interface Thread : NSThread

@end

@implementation Thread

- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Thread* thread = [[Thread alloc] initWithTarget: self selector: @selector(run) object: nil];
    [thread start];
}

- (void)run {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    
    // 仅使当前前程不会死，但干不了别任务
//    while (1);
    
    // 使用RunLoop可使当前线程不干事情时休眠
//    [[NSRunLoop currentRunLoop] run];
    //- (BOOL)runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate; run底层调用此方法，传入默认DefaultMode，是没有source0/source1/timers/observers的
//    NSLog(@"end------"); // 如果Mode里面没有任何source0/source1/timers/observers，RunLoop就会自动关闭
    
    // 往RunLoop添加source0/source1/timers/observers任意一个
    [[NSRunLoop currentRunLoop] addPort: [NSPort new] forMode: NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    // 没打印end说明当前线程已休眠，添加了source1后就没有事情干了
    NSLog(@"end------");
    
}


@end
