//
//  Person.m
//  Block循环引用
//
//  Created by 张旭洋 on 2024/8/12.
//

#import "Person.h"

@implementation Person

- (void)test {
//    __unsafe_unretained typeof(self)weakSelf = self;
    __weak typeof(self)weakSelf = self;
    
    self.block = ^{
        // block引用（捕获）self
        // self又持有block
        NSLog(@"%d", self.age);
    };
    self.block();
    
//    self.block = ^(Person * _Nonnull person) {
//        NSLog(@"%d", person.age);
//    };
//    self.block(self);
    
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
