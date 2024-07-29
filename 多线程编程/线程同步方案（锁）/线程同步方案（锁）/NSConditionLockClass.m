//
//  NSConditionLockClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "NSConditionLockClass.h"

@interface NSConditionLockClass ()

//@property (nonatomic, strong)NSLock* lock;
@property (nonatomic, strong)NSConditionLock* conditionLock;

@end

// NSConditionLock是对NSCondition的进一步封装，可以设置具体的条件值

@implementation NSConditionLockClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 默认condition条件值为0
//        self.conditionLock = [[NSConditionLock alloc] init];
//        NSLog(@"%ld", self.conditionLock.condition); // 0
        
        self.conditionLock = [[NSConditionLock alloc] initWithCondition: 1];
    }
    return self;
}

- (void)otherTest {
    
    // 三个线程同时进行
    [[[NSThread alloc] initWithTarget: self selector: @selector(p_one) object: nil] start];
    [[[NSThread alloc] initWithTarget: self selector: @selector(p_two) object: nil] start];
    [[[NSThread alloc] initWithTarget: self selector: @selector(p_three) object: nil] start];
    
}

// 下面达到了先添加才能后删除的效果，通过设置线程间的依赖，控制了线程的执行顺序

//// 删除数组中的元素
//- (void)p_removeFromData {
//    
////    [self.conditionLock lock];
//    [self.conditionLock lockWhenCondition: 2];
//    
//    NSLog(@"删除了元素");
//    
//    [self.conditionLock unlock];
//    
//}
//
//// 往数组中添加元素
//- (void)p_addToData {
//    sleep(7);
//    [self.conditionLock lockWhenCondition: 1];
//    
//    NSLog(@"添加了元素");
//    
//    [self.conditionLock unlockWithCondition: 2];
//}

- (void)p_one {
    
    [self.conditionLock lockWhenCondition: 1];
    
    NSLog(@"_one");
    
    [self.conditionLock unlockWithCondition: 2];
    
}

- (void)p_two {
    [self.conditionLock lockWhenCondition: 2];
    sleep(1);
    NSLog(@"_two");
    
//    [self.conditionLock unlock];
    [self.conditionLock unlockWithCondition: 3];
}

- (void)p_three {
//    [self.conditionLock lockWhenCondition: 2];
    [self.conditionLock lockWhenCondition: 3];
    
    NSLog(@"_three");
    
    [self.conditionLock unlock];
}

@end
