//
//  NSRecursiveLockClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "NSRecursiveLockClass.h"

@interface NSRecursiveLockClass ()

@property (nonatomic, strong)NSRecursiveLock* moneyLock;

@end

// NSRecursiveLock也是对mutex递归锁的封装，API跟NSLock基本一致

@implementation NSRecursiveLockClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyLock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)drawMoney {
    
    [self.moneyLock lock];
    
    [super drawMoney];
    
    [self.moneyLock unlock];
    
}

- (void)saveMoney {
    
    [self.moneyLock lock];
    
    [super saveMoney];
    
    [self.moneyLock unlock];
    
}

@end
