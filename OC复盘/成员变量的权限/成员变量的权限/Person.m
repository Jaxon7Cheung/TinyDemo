//
//  Person.m
//  成员变量的权限
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Person.h"

@implementation Person

- (NSInteger)numbersOfGF {
    return _numbersOfGF;
}

- (void)setNumbersOfGF:(NSInteger)numbersOfGF {
    _numbersOfGF = numbersOfGF;
}

- (void)test {
    _passWord = 123;
    _address = @"西安";
}

- (NSInteger)passWord {
    return _passWord;
}

- (void)setPassWord:(NSInteger)passWord {
    _passWord = passWord;
}

@end
