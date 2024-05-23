//
//  Student.m
//  关于属性的说明
//
//  Created by 张旭洋 on 2023/8/12.
//

#import "Student.h"

@implementation Student

//修改自动生成的成员变量的名字
@synthesize name = _myName;
@synthesize age = _myAge;

- (NSInteger)height {
    return _height;
}

- (void)print {
    NSLog(@"name:%@ age:%ld", _myName, _myAge);
}

@end
