//
//  ViewController.m
//  RunLoop线程保活细节分析
//
//  Created by 张旭洋 on 2024/8/26.
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

@property (nonatomic, strong)Thread* thread;
@property (nonatomic, assign, getter=isStopped)BOOL stopped;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    
    self.stopped = NO;
    
//    self.thread = [[Thread alloc] initWithTarget: self selector: @selector(run) object: nil];
    self.thread = [[Thread alloc] initWithBlock:^{
        NSLog(@"%@---begin---", [NSThread currentThread]);
        
        // 往RunLoop里添加source1
        [[NSRunLoop currentRunLoop] addPort: [NSPort new] forMode: NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run]; // ...
        
        // run方法实际上会在循环中调用runMode方法，他专门用于开启一个永不销毁的线程，如下
    //    while (1) {
    //        [[NSRunLoop currentRunLoop] runMode:<#(nonnull NSRunLoopMode)#> beforeDate:<#(nonnull NSDate *)#>];
    //    }
        // CFRunLoopStop(CFRunLoopGetCurrent());只是停止了其中的一次runMode，所以线程并没有销毁
        
        while (weakSelf && !weakSelf.isStopped) {
            [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode beforeDate: [NSDate distantFuture] ];
        }
        
        NSLog(@"%@---end---", [NSThread currentThread]);
    }];
    [self.thread start];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self test];
//    }); // 虽然也是在子线程里做事，但又开了个新线程
    
    // waitUntilDone参数设置为YES代表等待指定线程的任务执行完毕后在执行后面的代码
    [self performSelector: @selector(test) onThread: self.thread withObject: nil waitUntilDone: YES];
    // 如果YES，也就是等test方法做完了，在执行下句；如果NO，就不等了
//    NSLog(@"?waitUntilDone?");
}

// 在RunLoop下做一些事情
// 唤醒的RunLoop做完事情后，就休眠
- (void)test {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
}

// 此方法是为了保RunLoop的命
//- (void)run {
//    NSLog(@"%@", [NSThread currentThread]);
//    
//    // 往RunLoop里添加source1
//    [[NSRunLoop currentRunLoop] addPort: [NSPort new] forMode: NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];
//    
//    
//    NSLog(@"%@---end---", [NSThread currentThread]);
//}

// 用来停止子线程的RunLoop
- (void)stop {
    // 设置标记为YES
    self.stopped = YES;
    // 停掉当前RunLoop并退出循环
    
    // 停掉子线程的RunLoop来结束线程
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    
}

// 看下Controller挂了没（Controller没有死，线程也没有死）
// 不创建子线程Controller却挂了
- (void)dealloc
{
    NSLog(@"%s", __func__);
    
    // 清空强指针线程是不会销毁的
    [self performSelector: @selector(stop) onThread: self.thread withObject: nil waitUntilDone: YES];
    self.thread = nil;
}

/*
 是不是
 线程thread内部对Controller产生了强引用Target: self
 Controller又强持有thread
 产生了循环引用
 解决方案：初始化方法改为不对Controller强引用的方法（但线程没有挂）
 */

@end
