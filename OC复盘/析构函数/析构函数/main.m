//
//  main.m
//  析构函数
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>
#import "Hero.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Hero* hero = [[Hero alloc] init];
        
        
        NSLog(@"Hello, World!");
        
        //手动释放对象 发送release消息 而不是dealloc
        [hero release];
    }
    //关掉ARC之后就不会自动调用dealloc了 --> MRC
    return 0;
}
