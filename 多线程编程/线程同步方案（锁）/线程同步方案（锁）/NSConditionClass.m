//
//  NSConditionClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "NSConditionClass.h"

@interface NSConditionClass ()

//@property (nonatomic, strong)NSLock* lock;
@property (nonatomic, strong)NSCondition* condition;
@property (nonatomic, strong)NSMutableArray* data;

@end

// 对锁mutex和条件condition的封装

@implementation NSConditionClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.condition = [[NSCondition alloc] init];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest {
    
    // 两个线程同时进行
    [[[NSThread alloc] initWithTarget: self selector: @selector(p_removeFromData) object: nil] start];
    [[[NSThread alloc] initWithTarget: self selector: @selector(p_addToData) object: nil] start];
    
}

// 生产者 - 消费者模式 实现跨线程执行

// 删除数组中的元素
- (void)p_removeFromData {
    
    [self.condition lock];
    NSLog(@"p_remove --- begin");
    
    if (![self.data count]) {
        // 等待
        [self.condition wait];
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    [self.condition unlock];
    
}

// 往数组中添加元素
- (void)p_addToData {
    
    [self.condition lock];
    
    [self.data addObject: @"AddTest"];
    NSLog(@"添加了元素");
    
    // 添加完元素后，唤醒一个正在等待的线程（发送一个信号）
    [self.condition signal];
    // 唤醒所有正在等待的线程
//    [self.condition broadcast];
    
    [self.condition unlock];
    
}

//- (void)dealloc
//{
//    pthread_mutex_destroy(&_mutex);
//    pthread_cond_destroy(&_cond);
//}


@end
