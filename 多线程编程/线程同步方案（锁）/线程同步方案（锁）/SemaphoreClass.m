//
//  SemaphoreClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "SemaphoreClass.h"

@interface SemaphoreClass ()

@property (nonatomic, strong)dispatch_semaphore_t semaphore;
@property (nonatomic, strong)dispatch_semaphore_t ticketSemaphore;

@end

@implementation SemaphoreClass

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.semaphore = dispatch_semaphore_create(5);
        self.ticketSemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 20; ++i) {
        [[[NSThread alloc] initWithTarget: self selector:@selector(test) object: nil] start];
    }
}

// 控制最大并发数量：5个线程
- (void)test {
    
    // 如果信号量的值 > 0，就-1，往下执行
    // 如果信号量的值 <= 0，当前线程就会进入休眠等待（知道信号量的值 > 0）
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    sleep(3);
    NSLog(@"test --- %@", [NSThread currentThread]);
    
    // 让信号量的值+1
    dispatch_semaphore_signal(self.semaphore);
}

// 如果要保证线程同步（同一时间内只有1个线程进行），那就让信号量初始化为1
// 一般就是FOREVER，即一直等，不然达不到线程同步的效果
- (void)saleTicket {
    
    dispatch_semaphore_wait(self.ticketSemaphore, DISPATCH_TIME_FOREVER);
    
    [super saleTicket];
    
    dispatch_semaphore_signal(self.ticketSemaphore);
    
}

@end
