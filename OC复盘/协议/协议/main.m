//
//  main.m
//  协议
//
//  Created by 张旭洋 on 2023/10/8.
//

/*
 协议：定义一组方法，由其他的类来实现。
 某个类实现了这个协议，说明该类遵循了这个协议
 
 非正式协议：NSObject的类别
 正式协议：
 */



#import <Foundation/Foundation.h>
//一个类可以同时遵守多个协议
#import "Kid.h"
#import "Mom.h"
#import "Dad.h"
//一个协议可以被多个类使用
#import "GrandMa.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Kid* kid = [[Kid alloc] init];
        [kid playGames];
        
        Mom* mom = [[Mom alloc] init];
        [mom cook];
        
        Dad* dad = [[Dad alloc] init];
        [dad playGames];
        [dad cook];
        
        NSLog(@"");
        GrandMa* grandMa = [[GrandMa alloc] init];
        grandMa.fam = kid;
        //若kid没有实现Chat协议里的方法，运行后就会崩溃
        [grandMa chatWithMyChild];  //调用协议里的方法
        
        //判断某个对象是否遵守协议 [dad conformsToProtocol: @protocol(Chat)];
        if ([grandMa conformsToProtocol: @protocol(Chat)]) {
            NSLog(@"YES");
        } else {
            NSLog(@"NO");
        }
        
    }
    return 0;
}
