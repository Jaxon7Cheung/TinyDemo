//
//  main.m
//  单例模式
//
//  Created by 张旭洋 on 2023/9/12.
//

//alloc copy release autorelease

#import <Foundation/Foundation.h>
#import "Singleton.h"

void haha(void) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"Hahahahah233");
    });
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Singleton* person1 = [Singleton defaultPerson];
        NSLog(@"%p", person1);
        Singleton* person2 = [Singleton defaultPerson];
        NSLog(@"%p", person2);
    }
    return 0;
}
