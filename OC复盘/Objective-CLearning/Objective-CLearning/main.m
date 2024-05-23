//
//  main.m
//  Objective-CLearning
//
//  Created by 张旭洋 on 2023/8/10.
//

///面向过程编程 数据 算法 符合数学逻辑
///面向对象编程 解决问题的实体（对象） 符合生活逻辑
/*
 头文件导入
 #import 导入系统库文件 自动检查文件是否被重复导入
 #import "用户自定义文件" 框架 系统库包 常用的类、结构体、函数、类型、宏 使用多个.h文件声明
 #import <系统库文件> 主头文件 里面导入了Foundation框架里的所有头文件
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    //自动释放池
    /*
     帮我们清理动态分配的（工厂方法创建的、自动释放池对象）对象
     @autoreleasepool { 创建
     insert code...
     } 销毁
     */
    @autoreleasepool {
        // insert code here...
        //实例化一个对象
        /*
         [Person new];
         [[Person alloc] init];
         都是动态分配一个对象的内存，并初始化（动态分配肯定是分配在堆区，堆区的数据需用指针访问）
         用什么类型构建对象，就什么类型指针访问（指向这块内存的首地址，进而访问这个对象）
         为方便表述，把jackeyZ这个指针变量称为对象
         */
        Person* jackeyZ = [[Person alloc] init];
        [jackeyZ singSongs: 1];
        
        
        //command + R 运行程序
        //command + B 编译程序
        //command + N New File
        /*
         作为输出函数使用，相对于printf
         添加了时间戳、工程名字、自动换行
         
         @"" OC的字符串类型 对象类型 有基本特征、行为
         ""  C的字符串类型 集合
         
         NS来源于Jobs NextStep cocoa框架
         OC没有命名空间
         */
        NSLog(@"Hello World!");
        //printf("Hello World!");
    }
    return 0;
}
