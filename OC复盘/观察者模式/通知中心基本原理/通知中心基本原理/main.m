//
//  main.m
//  通知中心基本原理
//
//  Created by 张旭洋 on 2023/10/14.
//

#import <Foundation/Foundation.h>
//观察者模式 iOS：通知中心（iOS自带） KVO
#import "Observer.h"
#import "Client.h"

 //通知中心是一个单例，调用 NSNotificationCenter.defaultCenter() 方法，可以获取到全局唯一的 NSNotificationCenter 实例

/*
    其他类给通知中心发送信息，然后通知中❤️寻找哪个类作为观察者在ta这儿进行了注册，最后执行观察者接收信息并调用指定的方法
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Observer* observer = [[Observer alloc] init];
        [observer registerNotification];
        
        Client* client = [[Client alloc] init];
        [client postNotification];
        
        Client* client2 = [[Client alloc] init];
        [client2 postNotification];
    }
    return 0;
}
