//
//  main.m
//  RunLoop学习
//
//  Created by 张旭洋 on 2024/8/13.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    
    // iOS程序默认是有RunLoop的，程序会一直保持运行状态，不会退出
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    
    // 没有RunLoop，程序一启动就会退出
//    return 0;
}

// 等效伪代码
//int main(int argc, char * argv[]) {
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        int retVal = 0;
//        do {
//            // 睡眠中等待消息
//            int message = sleep_and_wait();
//            // 处理消息
//            retVal = process_message(message);
//        } while (0 == retVal);
//        return 0;
//    }
//}
