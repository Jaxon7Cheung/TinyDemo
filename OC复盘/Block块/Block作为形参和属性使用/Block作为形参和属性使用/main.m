//
//  main.m
//  Block作为形参和属性使用
//
//  Created by 张旭洋 on 2023/10/17.
//

#import <Foundation/Foundation.h>
#import "Jacky.h"
#import "Jaxon.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //block可以存在栈区，堆区，全局
        /*
         block刚创建出来时存放在栈区
         使用时copy到堆区
         */
//        void(^block)(void) = ^ {
//            NSLog(@"我在全局区");
//        };
        
        Jaxon* jaxon = [[Jaxon alloc] init];
//        [jaxon askJackyForHelp:^(int num) {
//            Jacky* jacky = [[Jacky alloc] init];
//            [jacky helpDoWith: num];
//        }];
        //能用代理做的也可以试着用Block做
        
//        [jaxon askJackyForHelp:^(int num) {
//                    Jacky* jacky = [[Jacky alloc] init];
//                    [jacky helpDoWith: num];
//                } isOK:^(BOOL boolValue) {
//                    if (boolValue) {
//                        NSLog(@"帮忙成功");
//                    } else {
//                        NSLog(@"帮忙失败");
//                    }
//                }];
        
        
//        [jaxon askJackyForHelp2:^(int num) {
//            Jacky* jacky = [[Jacky alloc] init];
//            [jacky helpDoWith: num];
//                } isOK:^(BOOL isOK) {
//                    if (isOK) {
//                        NSLog(@"帮忙成功");
//                    } else {
//                        NSLog(@"帮忙失败");
//                    }
//                }];
        
        jaxon.helpBlock = ^(int num) {
            NSLog(@"我自己做%@次", @(num));
        };
        [jaxon askMyselfDo];
        
    }
    return 0;
}
