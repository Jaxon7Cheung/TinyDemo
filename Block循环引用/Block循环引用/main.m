//
//  main.m
//  Block循环引用
//
//  Created by 张旭洋 on 2024/8/12.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        __block Person* person = [[Person alloc] init];
        
        person.age = 21;
        
//        [person test];
        
//        __weak typeof(person) weakPerson = person;
//        __weak Person* weakPerson = person;
        person.block = ^{
            NSLog(@"%d", person.age);
            person = nil;
//            NSLog(@"%d", weakPerson.age);
        };
        person.block();
        
        
        NSLog(@"111111111111");
    }
    return 0;
}
