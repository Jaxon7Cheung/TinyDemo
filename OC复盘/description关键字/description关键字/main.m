//
//  main.m
//  description关键字
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student* henry = [Student new];
        henry.name = @"Henry";
        henry.age = 24;
        //[henry showMessage];
        NSLog(@"%@", henry); //系统会自动向description发送一条消息
//        NSLog(@"name:%@ age:%ld stuID:%@", henry.name, henry.age, henry.stuID);
        
        Student* alan = [Student new];
        alan.name = @"Alan";
        alan.age = 26;
        //[alan showMessage];
        NSLog(@"%@", alan);
//        NSLog(@"name:%@ age:%ld stuID:%@", alan.name, alan.age, alan.stuID);
        
//        NSLog(@"%@", alan);
//        NSLog(@"%@", [alan description]);
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
