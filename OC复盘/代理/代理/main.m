//
//  main.m
//  代理
//
//  Created by 张旭洋 on 2023/10/9.
//

//代理模式或委托模式

//1. 定义委托方法
//2. 创建委托对象并实现委托协议
//3. 在另一个类声明委托对象，和触发委托方法的方法

/*
 定义一套接口，某对象若想接受另一个对象的委托，则需要遵循此接口，以便成为其“委托对象”。而这“另一个对象”则给其委托对象回传一些消息，也可在发生相关事件时通知委托对象
 */

#import <Foundation/Foundation.h>
#import "Jackson.h"
#import "Jane.h"
#import "Henry.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Jackson* jackson = [[Jackson alloc] init];
        Jane* jane = [[Jane alloc] init];
        Henry* henry = [[Henry alloc] init];
        
        jackson.delegate = jane;
        
        [jackson askJaneForHelp];
    }
    return 0;
}
