//
//  SynchronizedClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "SynchronizedClass.h"

// @synchronized是对mutex递归锁的封装

@implementation SynchronizedClass

- (void)drawMoney {
    
    @synchronized (self) {
        [super drawMoney];
    }
    
}

- (void)saveMoney {
    
    @synchronized (self) {
        [super saveMoney];
    }
    
}

- (void)saleTicket {
    // 放进去的这个token对象要是同一个，才能保证同一把锁
    // 一个需求：外部有多个不同的对象调用，要保证线程同步，要换成类对象（保证同一把锁🔒）
//    @synchronized ([self class]) {
    
    static NSObject* lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc] init];
    });
    
    @synchronized (lock) {
        [super saleTicket];
    }
}

// 递归锁，递归是可行的
- (void)otherTest {
    @synchronized ([self class]) {
        NSLog(@"123");
        [self otherTest];
    }
}

@end
