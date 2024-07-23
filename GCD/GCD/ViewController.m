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
    
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialQueue, ^{
        NSLog(@"a");
    });
    
    NSLog(@"b");
}

void textDemo(void) {
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

void textDemo1(void) {
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
void textDemo2(void) {
    // 串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("bySelf", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1 --- %@", [NSThread currentThread]);
    // 异步函数
    dispatch_async(serialQueue, ^{
        NSLog(@"2 --- %@");
    });
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    mainSyncTest();
//    textDemo();
    textDemo2();
}


@end
