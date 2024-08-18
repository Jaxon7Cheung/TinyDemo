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
        [NSRunLoop currentRunLoop];
        /*__block*/ Person* person = [[Person alloc] init];
        
        person.age = 21;
        
//        [person test];
        
        __weak typeof(person) weakPerson = person;
//        __weak Person* weakPerson = person;
        
//        person.block = ^{
//            NSLog(@"%d", person.age);
//            person = nil;
////            NSLog(@"%d", weakPerson.age);
//        };
        
        // __block
//        person.block();
        
        // 这种情况虽没有引起循环引用，但block延迟执行2秒，等person释放后，就无法获取其age，很不合理
        person.block = ^{
            // +++
            __strong __typeof(weakPerson)strongPerson = weakPerson;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"%d", strongPerson.age);
            });
        };
        person.block();
        
        NSLog(@"111111111111");
    }
    return 0;
}
