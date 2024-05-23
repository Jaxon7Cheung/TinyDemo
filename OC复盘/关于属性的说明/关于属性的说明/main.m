//
//  main.m
//  关于属性的说明
//
//  Created by 张旭洋 on 2023/8/12.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student* s = [[Student alloc] init];
        s.name = @"XY";
        s.age = 19;
        
        [s print];
        
        //如果一个成员变量是按照官方的规范添加的setter/getter方法，即便没有使用@property添加属性,也可以使用点语法进行访问
        NSLog(@"height:%ld", s.height); //调用getter方法
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
