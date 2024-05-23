//
//  Person.m
//  成员变量的访问
//
//  Created by 张旭洋 on 2023/8/10.
//

#import "Person.h"

@implementation Person

- (int)age {
    return _age;
}

- (void)setAge: (int)age {
    _age = age;
}

@end
