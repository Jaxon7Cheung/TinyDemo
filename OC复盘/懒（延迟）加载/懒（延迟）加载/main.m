//
//  main.m
//  懒（延迟）加载
//
//  Created by 张旭洋 on 2023/8/10.
//

//程序员过年租女朋友应付家里，完事儿后再放掉 就是懒加载现实逻辑的体现
//懒加载 一般体现在getter方法重写

//当对象需要完成业务需求时，才加载这些资源

#import <Foundation/Foundation.h>
#import "Coder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Coder* jakeyZ = [[Coder alloc] initWithName: @"jakeyZ"];
        
        [jakeyZ goHome];
        NSLog(@"%@", jakeyZ);
        
        
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
