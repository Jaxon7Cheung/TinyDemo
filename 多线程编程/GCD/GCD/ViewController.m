//
//  ViewController.m
//  GCD
//
//  Created by 张旭洋 on 2024/7/23.
//

#import "ViewController.h"

void mainSyncTest(void) {
    /*
     主队列同步
     不会开启线程
     会崩溃！
     */
    NSLog(@"start");
    
    // dispatch_queue_t concurrentQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"a");
    });
    
    NSLog(@"b");
}

void mainAyncTest(void) {
    NSLog(@"start");
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"a");
    });
    
//    sleep(3);
    NSLog(@"b");
    

}

void concurrentAsyncTest(void) {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1 --- %@", [NSThread currentThread]);
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"2 --- %@", [NSThread currentThread]);
        
        dispatch_async(concurrentQueue, ^{
            NSLog(@"3 --- %@", [NSThread currentThread]);
        });
        
        NSLog(@"4 --- %@", [NSThread currentThread]);
    });
    
    NSLog(@"5 --- %@", [NSThread currentThread]);
}

void concurrentSyncTest(void) {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1 --- %@", [NSThread currentThread]);
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"2 --- %@", [NSThread currentThread]);
        
        dispatch_sync(concurrentQueue, ^{
            NSLog(@"3 --- %@", [NSThread currentThread]);
        });
        
        NSLog(@"4 --- %@", [NSThread currentThread]);
    });
    
    NSLog(@"5 --- %@", [NSThread currentThread]);
}

// 异步串行队列，会开启新线程
void serialAsyncTest(void) {
    // 串行队列
    NSLog(@"start --- %@", [NSThread currentThread]);
    
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 5; ++i) {
        dispatch_async(serialQueue, ^{
            NSLog(@"%d --- %@", i, [NSThread currentThread]);
        });
    }
    
    NSLog(@"hello queue");
    NSLog(@"end --- %@", [NSThread currentThread]);
}

void serialSyncTest(void) {
    NSLog(@"start --- %@", [NSThread currentThread]);
    
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 5; ++i) {
        dispatch_sync(serialQueue, ^{
            NSLog(@"%d --- %@", i, [NSThread currentThread]);
        });
    }
    
    NSLog(@"hello queue");
    NSLog(@"end --- %@", [NSThread currentThread]);
}

void serialSyncAndAsyncTest(void) {
    NSLog(@"start --- %@", [NSThread currentThread]);
    
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        NSLog(@"a --- %@", [NSThread currentThread]);
        dispatch_sync(serialQueue, ^{
            NSLog(@"b --- %@", [NSThread currentThread]);
        });
        NSLog(@"d --- %@", [NSThread currentThread]);
    });
    
    NSLog(@"hello queue");
    NSLog(@"end --- %@", [NSThread currentThread]);
}

void concurrentSyncAndAsyncTest(void) {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"1");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"2");
    });
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"3");
    });
    
    NSLog(@"0");
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"7");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"8");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"9");
    });
    // 3 0 1 2 7 9 8
    // 3 0 1 7 9 8 2
    // 3 0 1 2 7 8 9
    // 3 1 0 2 7 8 9
    // 3 2 1 0 7 8 9
    // 3 1 2 0 7 9 8
}

void communicateAmongThread(void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 6; ++i) {
            NSLog(@"1 --- %@", [NSThread currentThread]);
        }
         
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"2 --- %@", [NSThread currentThread]);
        });
    });
}

void barrierFunc(void) {
    dispatch_queue_t queue = dispatch_queue_create("666", DISPATCH_QUEUE_CONCURRENT);
 
    dispatch_async(queue, ^{
        NSLog(@"1 --- %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2 --- %@", [NSThread currentThread]);
    });
 
    dispatch_barrier_async(queue, ^{
        NSLog(@"----barrier-----%@", [NSThread currentThread]);
    });
 
    dispatch_async(queue, ^{
        NSLog(@"3 --- %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"4 --- %@", [NSThread currentThread]);
    });
}

void delayExec(void) {
    NSLog(@"run -- 0");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 3秒后异步执行这里的代码...
       NSLog(@"run -- 2");
    });
}

void onceExec(void) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 只执行一次的代码（这里面是默认线程安全的）
        NSLog(@"Hhhhhhhh");
    });
}

void queueGroup(void) {
    // GCD的队列组
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 添加异步任务到并发队列中
    dispatch_group_async(group, queue, ^{
        // 执行1个耗时的异步操作
        for (int i = 0; i < 5; ++i) {
            NSLog(@"1 --- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        // 执行1个耗时的异步操作
        for (int i = 0; i < 5; ++i) {
            NSLog(@"2 --- %@", [NSThread currentThread]);
        }
    });
    
    // 唤醒：等前面的任务执行完毕后，会自动执行这个任务
//    dispatch_group_notify(group, queue, ^{
//        // 等前面的异步操作都执行完毕后，回到主线程...
//        dispatch_async(dispatch_get_main_queue(), ^{
//            for (int i = 0; i < 5; ++i) {
//                NSLog(@"3 --- %@", [NSThread currentThread]);
//            }
//        });
//    });
    
    // 等效
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        // 等前面的异步操作都执行完毕后，回到主线程...
//        for (int i = 0; i < 5; ++i) {
//            NSLog(@"3 --- %@", [NSThread currentThread]);
//        }
//    });
    
    // 等任务1、2完成，再并发执行3、4
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 5; ++i) {
            NSLog(@"3 --- %@", [NSThread currentThread]);
        }
    });
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 5; ++i) {
            NSLog(@"4 --- %@", [NSThread currentThread]);
        }
    });
    
}

void manageQueue(void) {
//    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    
//    dispatch_retain(serialQueue);
//    dispatch_release(serialQueue);
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    dispatch_queue_t globalQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_queue_t globalQueueDefault = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_t globalQueueLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
//    dispatch_queue_t globalQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
}

void serialBackgroundQueue(void) {
    // 需求：生成一个后台的串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t globalQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_set_target_queue(serialQueue, globalQueueBackground);
}

void abandonSerialQueuesToConcurrent(void) {
    dispatch_queue_t targetQueue = dispatch_queue_create("test.target.queue", DISPATCH_QUEUE_SERIAL);
 
    dispatch_queue_t queue1 = dispatch_queue_create("test.1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("test.2", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue3 = dispatch_queue_create("test.3", DISPATCH_QUEUE_SERIAL);
    
    dispatch_set_target_queue(queue1, targetQueue);
    dispatch_set_target_queue(queue2, targetQueue);
    dispatch_set_target_queue(queue3, targetQueue);
        
    dispatch_async(queue1, ^{
        NSLog(@"1 in");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"1 out");
    });
 
    dispatch_async(queue2, ^{
        NSLog(@"2 in");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"2 out");
    });
    dispatch_async(queue3, ^{
        NSLog(@"3 in");
        [NSThread sleepForTimeInterval:1.f];
        NSLog(@"3 out");
    });
}

void suspendOrResumeQueue(void) {
    dispatch_queue_t queue = dispatch_queue_create("com.test.gcd", DISPATCH_QUEUE_SERIAL);
    //提交第一个block，延时5秒打印。
    dispatch_async(queue, ^{
        sleep(5);
        NSLog(@"After 5 seconds...");
    });
    //提交第二个block，也是延时5秒打印
    dispatch_async(queue, ^{
        sleep(5);
        NSLog(@"After 5 seconds again...");
    });
    //延时一秒
    NSLog(@"sleep 1 second...");
    sleep(1);
    //挂起队列
    NSLog(@"suspend...");
    dispatch_suspend(queue);
    //延时10秒
    NSLog(@"sleep 17 second...");
    sleep(17);
    //恢复队列
    NSLog(@"resume...");
    dispatch_resume(queue);
}

@interface ViewController ()

@end

@implementation ViewController

- (void)synchronizedSecurity {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 加锁保证block中执行完成才会执行其他的
//            @synchronized (self) {
                NSLog(@"1开始");
                sleep(2);
                NSLog(@"1结束");
//            }
        });
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            @synchronized (self) {
                NSLog(@"2开始");
                sleep(2);
                NSLog(@"2结束");
//            }
        });
}

void semaphoreSecurity(void) {
    dispatch_semaphore_t semalook = dispatch_semaphore_create(1);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semalook, DISPATCH_TIME_FOREVER);
        NSLog(@"1开始");
        sleep(2);
        NSLog(@"1结束");
        dispatch_semaphore_signal(semalook);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semalook, DISPATCH_TIME_FOREVER);
        NSLog(@"2开始");
        sleep(2);
        NSLog(@"2结束");
        dispatch_semaphore_signal(semalook);
    });
}

void lockSecurity(void) {
    NSLock *lock = [[NSLock alloc]init];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [lock lock];
        NSLog(@"1开始");
        sleep(2);
        NSLog(@"1结束");
        [lock unlock];
    });
     
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [lock lock];
        NSLog(@"2开始");
        sleep(2);
        NSLog(@"2结束");
        [lock unlock];
    });
}

// 死锁
- (void)test1 {
//    dispatch_queue_t serialQueue = dispatch_get_main_queue();
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_async(serialQueue, ^{
        NSLog(@"2");
        dispatch_sync(serialQueue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
}

// 顺序执行
- (void)test2 {
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL_WITH_AUTORELEASE_POOL);
    dispatch_sync(serialQueue, ^{
        NSLog(@"Task 1 begin: %@", [NSThread currentThread]);
        NSLog(@"Task 1 end");
    });
    NSLog(@"Task1 complete");
}

// 死锁，但并不会崩溃
// 所以GCD死锁的根本是任务循环等待阻塞，而崩溃的根本是sync提交时的死锁检查，实际开发中应该避免这种不会被检测到的情况出现，因为不会崩溃但它确一直占着线程资源
- (void)test3 {
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL_WITH_AUTORELEASE_POOL);
    dispatch_async(serialQueue, ^{ // 0
        NSLog(@"Task 1 begin: %@", [NSThread currentThread]);
        
        dispatch_sync(dispatch_get_main_queue(), ^{  // 1
            dispatch_sync(serialQueue, ^{  // 2
                NSLog(@"Task 2 begin");
            });
        });
        
        NSLog(@"Task 2 complete");
    });
    
    NSLog(@"main queue task complete");
}


- (void)test44 {
    NSLog(@"2");
}
- (void)test4 {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    
    // - (void)performSelector:(SEL)aSelector withObject:(nullable id)anArgument afterDelay:(NSTimeInterval)delay;
    // 此方法本质是在RunLoop中添加定时器
    
    //        [self performSelector: @selector(test44)];
    dispatch_sync(globalQueue, ^{
        NSLog(@"1");
        [self performSelector: @selector(test44) withObject: nil afterDelay: .0];
        NSLog(@"3");
        
        // 添加RunLoop
//        [[NSRunLoop currentRunLoop] addPort: [[NSPort alloc] init] forMode: NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode beforeDate: [NSDate distantFuture]];
    });
    
    // 在主线程中test44会打印，但在子线程中不会打印
//    NSLog(@"1");
//    [self performSelector: @selector(test44) withObject: nil afterDelay: .0];
//    NSLog(@"3");
}

- (void)test55 {
    NSLog(@"2");
}
- (void)test5 {
    NSThread* thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1");
        
//        [[NSRunLoop currentRunLoop] addPort: [[NSPort alloc] init] forMode: NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode beforeDate: [NSDate distantFuture]];
    }];
    [thread start];
    
    // 1
    // target thread exited while waiting for the perform
    [self performSelector: @selector(test55) onThread: thread withObject: nil waitUntilDone: YES];
}

//dispatch_sync：立马在当前线程同步执行任务
//dispatch_async：开启一个新线程
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    mainSyncTest();
//    mainAyncTest();
//    concurrentAsyncTest();
//    concurrentSyncTest();
//    serialAsyncTest();
//    serialSyncTest();
    
//    serialSyncAndAsyncTest();
//    concurrentSyncAndAsyncTest();
    
//    communicateAmongThread();
//    barrierFunc();
//    delayExec();
//    onceExec();onceExec();
    queueGroup();
//    abandonSerialQueuesToConcurrent();
//    suspendOrResumeQueue();
//    [self synchronizedSecurity];
//    semaphoreSecurity();
//    lockSecurity();
    
    // 关键：往当前串行队列同步添加任务，就会导致死锁
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
//    [self test5];
    
    
}


@end
