//
//  OSSpinLockClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/26.
//

#import "OSSpinLockClass.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockClass ()

@property (nonatomic, assign)NSInteger money;
@property (nonatomic, assign)NSInteger ticketsCount;

// OSSpinLock叫做“自旋锁”，等待锁的线程会处于忙等待状态，一只占用着CPU资源
/*
 性能高，忙等的好处：不会让线程睡眠，因为一旦线程睡着了，再去把线程唤醒，这中间也是要耗性能的，也是要花一定的时间切换线程；
                如果等待锁的时间非常短暂，就没必要让线程睡眠，这样更耗时间，干脆写个while循环稍微忙等一下
 */
 
/*
 为什么要同一把锁？
 如果每条线程下都创建一个新锁，那么这个锁开始永远都是未加锁状态
 故下一个线程不会等待上一个线程结束（线程不会阻塞），而是直接进行
 锁不一样，意味着不同线程可以同时进行
 */
@property (nonatomic, assign)OSSpinLock moneyLock;
@property (nonatomic, assign)OSSpinLock ticketLock;
//@property (nonatomic, assign)OSSpinLock spinLock2;

@end

@implementation OSSpinLockClass

/* 有多个函数时：
        1. 属性
        2. 静态全局变量
 */
static OSSpinLock moneyLock_;
// 让此全局变量只初始化一次
+ (void)initialize
{
    if (self == [OSSpinLockClass class]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            moneyLock_ = OS_SPINLOCK_INIT;
        });
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)drawMoney {
    OSSpinLockLock(&moneyLock_);
    
    [super drawMoney];
    
    OSSpinLockUnlock(&moneyLock_);
}

- (void)saveMoney {
    OSSpinLockLock(&moneyLock_);
    
    [super saveMoney];
    
    OSSpinLockUnlock(&moneyLock_);
}

//- (void)saleTicket {
//    OSSpinLockLock(&_ticketLock);
//    
//    [super saleTicket];
//    
//    OSSpinLockUnlock(&_ticketLock);
//}

// 只有1个函数时，可使用静态局部变量
- (void)saleTicket {
    static OSSpinLock ticketLock = OS_SPINLOCK_INIT;
    
    // 如果初始化时动态调用函数的，就不能使用static
    // 因为函数调用是在运行时确定的，而statis右边的变量必须要在编译时确定
//    static OSSpinLock ticketLock = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        ticketLock = test();
//    });
    
    OSSpinLockLock(&ticketLock);
    
    [super saleTicket];
    
    OSSpinLockUnlock(&ticketLock);
}




@end
