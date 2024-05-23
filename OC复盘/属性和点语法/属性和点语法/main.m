//
//  main.m
//  属性和点语法
//
//  Created by 张旭洋 on 2023/8/12.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student* s = [[Student alloc] init];
        [s setName: @"XY"];
        //%@：对象类型的占位符
        NSLog(@"%@", [s name]);
        
        //如果添加了属性，可以使用点运算符访问成员变量
        s.name = @"XY"; //调用了setName:
        s.age = 19;
        NSLog(@"name=%@", s.name); //调用了name方法
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
