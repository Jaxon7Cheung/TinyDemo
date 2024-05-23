//
//  main.m
//  Block
//
//  Created by 张旭洋 on 2023/10/17.
//

//Block 块，Objective-C闭包（可以在内部访问外部的值）
//Block 相当于C语言的函数指针，把一个函数写在一个函数内部，而OC并没有函数（方法）嵌套这一语法
//^ 块的符号
/*
 //void(^block)()
 
 block的定义
 返回值void (^block名字)(形参列表);
 
 block的实现
 ^返回值类型(参数列表) 返回值类型可以省略
 ^int(int a, int b)
 
 block的调用
 block名称(形参列表)
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//            1. 无参无返回值
//            void(^blockName)(void) = ^{
//                //Block的实现
//                NSLog(@"Hello World!");
//            };
//            blockName();
            
        //    2. 有参有返回值
        //    int(^sum)(int a, int b) = ^int(int a, int b) {
        //        return a + b;
        //    };
        //
        //    int s = sum(10, 20);
        //    NSLog(@"%d", s);
            
        //    3.s = sum(10, 20);
            int s = ^(int a, int b) {
                return a + b;
            }(10, 20);
            //这个块就是sum的名称
            NSLog(@"%d", s);
    }
    return 0;
}
