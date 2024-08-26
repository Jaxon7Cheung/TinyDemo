//
//  PermenantThread.m
//  RunLoop线程保活封装类
//
//  Created by 张旭洋 on 2024/8/26.
//

#import "PermenantThread.h"

// Thread仅为监控线程生命周期
@interface Thread : NSThread

@end

@implementation Thread

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end

@interface PermenantThread ()

@property (nonatomic, strong)Thread* innerThread;
@property (nonatomic, assign, getter=isStopped)BOOL stopped;

@end

@implementation PermenantThread

#pragma mark - public methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.stopped = NO;
        
        __weak typeof(self) weakSelf = self;
        self.innerThread = [[Thread alloc] initWithBlock:^{
            
            // 添加source1
            [[NSRunLoop currentRunLoop] addPort: [NSPort new] forMode: NSDefaultRunLoopMode];
            
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode beforeDate: [NSDate distantFuture]];
            }
        }];
        
        // 启动🍊
        [self.innerThread start];
    }
    return self;
}

//- (void)run {
//    if (!self.innerThread) return;
//    [self.innerThread start];
//}

- (void)executeTask:(PermenantThreadTask)task {
    if (!self.innerThread || !task) return;
    
//    if (self.innerThread.isExecuting) {
//        [self.innerThread start];
//    }
    
    // 执行任务就不必阻塞了NO
    [self performSelector: @selector(p_executeTask:) onThread: self.innerThread withObject: nil waitUntilDone: NO];
}

- (void)stop {
    if (!self.innerThread) return;
    
    // 停用RunLoop需要阻塞防止self野指针错误
    [self performSelector: @selector(p_stop) onThread: self.innerThread withObject: nil waitUntilDone: YES];
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    
    [self stop];
}

#pragma mark - private methods

- (void)p_executeTask:(PermenantThreadTask)task {
    task();
}

- (void)p_stop {
    self.stopped = YES;
    
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

@end
