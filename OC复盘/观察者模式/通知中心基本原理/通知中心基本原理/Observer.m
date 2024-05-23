//
//  Observer.m
//  通知中心基本原理
//
//  Created by 张旭洋 on 2023/10/14.
//

#import "Observer.h"

@implementation Observer

- (void)registerNotification {
    //注册一个通知中心
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center addObserver: self selector: @selector(takeAction:) name: @"Observer" object: nil];

}

- (void)takeAction: (NSNotification *)notification {
    
    NSLog(@"%@", notification.userInfo);
    
}

//如果我们在某个阶段不借用通知中心来发送消息了，但ta作为单例又一直存在，就会一直占用内存
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}
//在 ARC（Automatic Reference Counting）环境下，由于系统会自动管理内存，编译器会自动插入 dealloc 方法的实现，并调用父类的 dealloc 方法（不需要手动调用）。所以在 ARC 环境下，不需要手动调用 super dealloc。

//但是，在非 ARC 环境下（即手动管理内存的情况下），我们仍然需要在 dealloc 方法中手动调用 [super dealloc]，以确保正确释放父类的资源。

@end
