//
//  main.m
//  多线程
//
//  Created by 张旭洋 on 2024/7/23.
//

#import <Foundation/Foundation.h>

void test1(void) {
    NSLog(@"开始");
    NSInteger count = 1000 * 100;
    for (NSInteger i = 0; i < count; i++) {
        // 栈区
        NSInteger num = i;
        // 常量区
        NSString *name = @"RENO";
        // 堆区
        NSString *myName = [NSString stringWithFormat:@"%@ - %zd", name, num];
        NSLog(@"%@", myName);
    }
    NSLog(@"结束");
}

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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        textDemo();
        //  此项目无法开启多线程，应该是跟RunLoop有关
    }

    return 0;
}
