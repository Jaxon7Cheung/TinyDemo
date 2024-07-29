//
//  NSLockClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "NSLockClass.h"

@interface NSLockClass ()

@property (nonatomic, strong)NSLock* ticketLock;

@end

// NSLock是对mutex普通锁的封装

@implementation NSLockClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ticketLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)saleTicket {
    
    [self.ticketLock lock];
    
    [super saleTicket];
    
    [self.ticketLock unlock];
    
}

@end
