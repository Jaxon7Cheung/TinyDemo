//
//  PthreadMutexClass1.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/26.
//

#import "PthreadMutexClass1.h"
#import <pthread/pthread.h>

@interface PthreadMutexClass1 ()

@property (nonatomic, assign)pthread_mutex_t mutex;
@property (nonatomic, assign)pthread_mutex_t mutex1;

@end

@implementation PthreadMutexClass1

- (void)p_initMutex: (pthread_mutex_t *)mutex {
    
    // 递归锁：只允许 同一个线程 下对一把锁进行重复加锁
    
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
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_initMutex: &_mutex];
        [self p_initMutex: &_mutex1];
    }
    return self;
}

- (void)otherTest {
    
    pthread_mutex_lock(&_mutex);
    
    NSLog(@"%s", __func__);
//    [self otherTest1];
    // 这里给test1换一把锁可解决死锁
    
    static int count = 0;
    if (count < 10) {
        count++;
        
        [self otherTest];  // 递归
        // 这里给换用递归锁即可解决死锁
        // 即允许同步加锁
    }
    
    
    pthread_mutex_unlock(&_mutex);
}
/*
 死锁！
 */
- (void)otherTest1 {
    
    pthread_mutex_lock(&_mutex1);
    
    NSLog(@"%s", __func__);
    
    pthread_mutex_unlock(&_mutex1);
    
}


- (void)dealloc
{
    pthread_mutex_destroy(&_mutex);
    pthread_mutex_destroy(&_mutex1);
}

@end
