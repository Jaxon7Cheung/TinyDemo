//
//  PthreadMutexClass2.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "PthreadMutexClass2.h"
#import <pthread/pthread.h>

@interface PthreadMutexClass2 ()

@property (nonatomic, assign)pthread_mutex_t mutex;
@property (nonatomic, strong)NSMutableArray* data; // 用copy特性 + array方法变成了不可变数组？
// 条件
@property (nonatomic, assign)pthread_cond_t cond;

@end

@implementation PthreadMutexClass2

- (void)p_initMutex: (pthread_mutex_t *)mutex {
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    // 初始化锁
    // 第二个参数传NULL，等效于DEFAULT：pthread_mutex_init(mutex, NULL);
    pthread_mutex_init(mutex, &attr);
    // 销毁属性
    pthread_mutexattr_destroy(&attr);
    
    // 初始化条件
    pthread_cond_init(&_cond, NULL);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_initMutex: &_mutex];
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
    
    pthread_mutex_lock(&_mutex);
    NSLog(@"p_remove --- begin");
    
    if (![self.data count]) {
        // 等待
        pthread_cond_wait(&_cond, &_mutex);
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    pthread_mutex_unlock(&_mutex);
    
}

// 往数组中添加元素
- (void)p_addToData {
    
    pthread_mutex_lock(&_mutex);
    
    [self.data addObject: @"AddTest"];
    NSLog(@"添加了元素");
    
    // 添加完元素后，唤醒一个正在等待的线程（发送一个信号）
    pthread_cond_signal(&_cond);
    // 唤醒所有正在等待的线程
//    pthread_cond_broadcast(&_cond);
    
    pthread_mutex_unlock(&_mutex);
    
}

- (void)dealloc
{
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_cond);
}

@end
