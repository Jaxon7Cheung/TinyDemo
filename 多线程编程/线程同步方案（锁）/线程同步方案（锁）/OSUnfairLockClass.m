//
//  OSUnfairLockClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/26.
//

#import "OSUnfairLockClass.h"
#import <os/lock.h>

@interface OSUnfairLockClass ()

@property (nonatomic, assign)os_unfair_lock moneyLock;
@property (nonatomic, assign)os_unfair_lock ticketLock;

@end

// 从底层调用看，等待os_unfair_lock锁的线程会处于休眠状态，并非忙等

@implementation OSUnfairLockClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
        self.moneyLock  = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)drawMoney {
    
    os_unfair_lock_lock(&_moneyLock);
    
    [super drawMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
    
}

- (void)saveMoney {
    
    os_unfair_lock_lock(&_moneyLock);

    [super saveMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
    
}

- (void)saleTicket {
    
    os_unfair_lock_lock(&_ticketLock);
    
    [super saleTicket];
    
    os_unfair_lock_unlock(&_ticketLock);
}
// 若忘记解锁，就会拿不到锁，即死锁

@end
