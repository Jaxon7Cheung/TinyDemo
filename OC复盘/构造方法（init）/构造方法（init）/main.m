//
//  main.m
//  构造方法（init）
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Monster.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student* student = [[Student alloc] init];
        NSLog(@"name:%@ age:%ld", student.name, student.age);
        
//        NSObject* nsObject = [[NSObject alloc] init];
//        NSLog(@"%@", nsObject);
        
        Monster* monster = [[Monster alloc] initWithName: @"俄罗斯蓝猫" andHP: 101];
        NSLog(@"%@", monster);
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
