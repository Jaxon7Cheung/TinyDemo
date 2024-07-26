//
//  PthreadMutexClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/26.
//

#import "PthreadMutexClass.h"
#import <pthread/pthread.h>

@interface PthreadMutexClass ()

@property (nonatomic, assign)pthread_mutex_t moneyMutex;
@property (nonatomic, assign)pthread_mutex_t ticketMutex;

@end

// 互斥锁：等待的线程会处于休眠状态

@implementation PthreadMutexClass

- (void)p_initMutex: (pthread_mutex_t *)mutex {
    // 此宏定义是一个结构体：{_PTHREAD_MUTEX_SIG_init, {0}}
    // 下面两段代码与结构体基本语法不符（结构体必须在定义变量的同时赋值，静态初始化）
//        self.mutex = PTHREAD_MUTEX_INITIALIZER;
    
//        pthread_mutex_t mutex;
//        mutex = PTHREAD_MUTEX_INITIALIZER;
    
    // 静态初始化
//        pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
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
        [self p_initMutex: &_moneyMutex];
        [self p_initMutex: &_ticketMutex];
        
    }
    return self;
}

- (void)drawMoney {
    
    pthread_mutex_lock(&_moneyMutex);
    
    [super drawMoney];
    
    pthread_mutex_unlock(&_moneyMutex);
    
}

- (void)saveMoney {
    
    pthread_mutex_lock(&_moneyMutex);
    
    [super saveMoney];
    
    pthread_mutex_unlock(&_moneyMutex);
    
}

- (void)saleTicket {
    
    pthread_mutex_lock(&_moneyMutex);
    
    [super saleTicket];
    
    pthread_mutex_unlock(&_moneyMutex);
    
}

- (void)dealloc
{
    pthread_mutex_destroy(&_moneyMutex);
    pthread_mutex_destroy(&_ticketMutex);
}

@end
