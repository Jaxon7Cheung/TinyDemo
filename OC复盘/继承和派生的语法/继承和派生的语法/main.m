//
//  main.m
//  继承和派生的语法
//
//  Created by 张旭洋 on 2023/8/14.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //OC不具有多继承的特性
        
        Student* student = [[Student alloc] init];
        
        //继承
        student.name = @"XY";
        student.age = 19;
        [student sayHello];
        
        //派生
        student.stuID = @"077";
        [student study];
        
//        Person* person = [[Person alloc] init];
//        person.stuID = @"007";
//        [person study];
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
