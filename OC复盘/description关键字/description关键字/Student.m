//
//  Student.m
//  description关键字
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Student.h"

@implementation Student

- (void)showMessage {
    //self指针 指向当前调用方法的对象
    //self.name 并不是使用点运算符访问成员变量 而是间接调用setter/getter方法
    NSLog(@"name:%@ age:%ld stuID:%@", self.name, self.age, self.stuID);
}

//重写NSObject的方法，而且不能显示调用
- (NSString *)description {
    return [NSString stringWithFormat: @"name:%@ age:%ld stuID:%@", self.name, self.age, self.stuID];
}

@end
