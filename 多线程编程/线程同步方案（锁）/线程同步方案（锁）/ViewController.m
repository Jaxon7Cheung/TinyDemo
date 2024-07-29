//
//  ViewController.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/25.
//

#import "ViewController.h"
#import "Lock.h"
#import "OSSpinLockClass.h"
#import "OSUnfairLockClass.h"
#import "PthreadMutexClass.h"
#import "PthreadMutexClass1.h"
#import "PthreadMutexClass2.h"
#import "NSLockClass.h"
#import "NSRecursiveLockClass.h"
#import "NSConditionClass.h"

@interface ViewController ()

@property (nonatomic, strong)Lock* lock;

@property (nonatomic, strong)NSThread* thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 多条线程调用同一方法
//    [self saleTickets];
    
    // 多条线程调用不同方法
//    [self moneyTest];
    
//    self.lock = [[Lock alloc] init];
//    self.lock = [[OSSpinLockClass alloc] init];
//    self.lock = [[OSUnfairLockClass alloc] init];
//    self.lock = [[PthreadMutexClass alloc] init];
//    self.lock = [[PthreadMutexClass1 alloc] init];
//    self.lock = [[PthreadMutexClass2 alloc] init];
//    self.lock = [[NSLockClass alloc] init];
//    self.lock = [[NSRecursiveLockClass alloc] init];
//    self.lock = [[NSConditionClass alloc] init];
    
//    [self.lock saleTickets];
//    [self.lock moneyTest];
//    [self.lock otherTest];
    
    
//    self.thread = [[NSThread alloc] initWithBlock:^{
//        NSLog(@"thread test");
//        
//        // 启用RunLoop
//        [[NSRunLoop currentRunLoop] addPort: [[NSPort alloc] init] forMode: NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
//    }];
//    [self.thread start];
//    
//    // 线程的任务一旦执行完毕，生命周期就结束，无法再使用
//    // 保持线程的生命为什么要用RunLoop？用强指针解可以吧？
//    // 答：准确来讲，使用RunLoop是为了让线程保持激活状态，用强指针只能说明thread的那块内存在那儿，但thread已然不能使用
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self performSelector: @selector(test) onThread: self.thread withObject: nil waitUntilDone: NO];
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_async(queue, ^{
//        NSLog(@"1");
//        
//        [self performSelector: @selector(test) withObject: nil afterDelay: .0];
//        
//        NSLog(@"3");
//        [[NSRunLoop currentRunLoop] addPort: [[NSPort alloc] init] forMode: NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
//    });
    // 主线程几乎所有的事情都是交给RunLoop去做。比如UI界面的刷新、点击事件的处理、performSelector等等
}

- (void)test {
    NSLog(@"%s", __func__);
}

@end
