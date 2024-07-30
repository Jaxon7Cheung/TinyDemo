//
//  ViewController.m
//  读写安全方案
//
//  Created by 张旭洋 on 2024/7/29.
//

/*
 I/O操作：文件数据读写操作
 要实现读写安全，即以下需求：
    1. 多读单写*
    2. 不允许读写同时进行
 
 两种技术方案：
    1. pthread_rwlock
    2. dispatch_barrier_async
 */

#import "ViewController.h"
#import <pthread/pthread.h>

@interface ViewController ()

//@property (nonatomic, strong)dispatch_semaphore_t semaphore;
//@property (nonatomic, assign)pthread_rwlock_t lock;
@property (nonatomic, strong)dispatch_queue_t queue;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 信号量初始化为1，可以保证同一时间只有一个任务进行
//    self.semaphore = dispatch_semaphore_create(1);
    
    
//    for (int i = 0; i < 5; ++i) {
//        [[[NSThread alloc] initWithTarget: self selector: @selector(read) object: nil] start];
//        [[[NSThread alloc] initWithTarget: self selector: @selector(write) object: nil] start];
//    }
    
    // 方案1：
//    
//    // 初始化锁
//    pthread_rwlock_init(&_lock, NULL);
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    
//    for (int i = 0; i < 10; ++i) {
//        dispatch_async(queue, ^{
//            [self write];
//        });
//        dispatch_async(queue, ^{
//            [self read];
//        });
//    }
    
    // 方案2：
    /*
     此处的异步栅栏函数传入的并发队列必须是通过create创建的
     如果传入的是一个串行或是一个全局的并发队列，那这个函数便等同于dispatch_async
     */
    
    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; ++i) {
        [self read];
        [self read];
        [self write];
    }
}

// 方案2：

- (void)read {
    dispatch_async(self.queue, ^{
        sleep(0.57);
        NSLog(@"read");
    });
}

- (void)write {
    dispatch_barrier_async(self.queue, ^{
        sleep(0.57);
        NSLog(@"write");
    });
}

// 方案1：

//- (void)read {
//    pthread_rwlock_rdlock(&_lock);
////    sleep(0.5);
//    NSLog(@"%s", __func__);
//    
//    pthread_rwlock_unlock(&_lock);
//}
//
//- (void)write {
//    pthread_rwlock_wrlock(&_lock);
////    sleep(0.5);
//    NSLog(@"%s", __func__);
//    
//    pthread_rwlock_unlock(&_lock);
//}
//
//- (void)dealloc
//{
//    pthread_rwlock_destroy(&_lock);
//}

//// 读取并不会改变数据信息，所以最好让读取操作并发执行
//- (void)read {
////    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
//    
//    NSLog(@"%s", __func__);
//    
////    dispatch_semaphore_signal(self.semaphore);
//}
//
//// 同一时间内只允许一条线程在写
//- (void)write {
//    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
//    
//    NSLog(@"%s", __func__);
//    
//    dispatch_semaphore_signal(self.semaphore);
//}

@end
