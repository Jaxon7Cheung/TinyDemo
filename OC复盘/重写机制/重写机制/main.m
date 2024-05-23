//
//  main.m
//  重写机制
//
//  Created by 张旭洋 on 2023/8/14.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //让不同的对象响应不同的消息
        Person* person = [[Person alloc] init];
        Student* student = [[Student alloc] init];

        [person haveMeeting];
        [student haveMeeting];
        printf("\n");
        
        [person play];
        [person wakeUp];
        printf("\n");
        
        [student play];
        [student wakeUp];
        printf("\n");
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
