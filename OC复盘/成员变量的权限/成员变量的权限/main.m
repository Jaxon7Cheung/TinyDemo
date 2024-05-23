//
//  main.m
//  成员变量的权限
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person* person = [[Person alloc] init];
        //如果getter/setter方法的命名规则与官方吻合，可以直接使用.运算符访问成员变量（间接调用setter/getter方法）
        person.numbersOfGF = 3;
        NSLog(@"numbersOfGF:%ld", person.numbersOfGF);
        
        person->_name = @"Henry";
        NSLog(@"name:%@", person->_name);
        
        person.passWord = 456;
        NSLog(@"passWord:%ld", person.passWord);
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
