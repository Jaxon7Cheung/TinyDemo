//
//  main.m
//  属性关键字
//
//  Created by 张旭洋 on 2023/8/12.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student* s = [[Student alloc] init];
        //Assignment to readonly property
        //s.money = 180;
        NSLog(@"%ld", s.money);
        
        [s gNAME: @"JZ"];
        NSLog(@"%@", [s gNAME]);
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
