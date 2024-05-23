//
//  Student.m
//  属性和点语法
//
//  Created by 张旭洋 on 2023/8/12.
//

#import "Student.h"

@implementation Student

//早期版本必须添加，现在可以省略
//当成员变量和属性的名字不一致时，可以通过synthesize进行修改，还有一些其他的衍生用法
@synthesize name; //不需要声明属性的类型
@synthesize age;

//- (NSString *)name {
//    return _name;
//}
//
//- (void)setName:(NSString *)name {
//    _name = name;
//}
//
//- (NSInteger)age {
//    return _age;
//}
//
//- (void)setAge:(NSInteger)age {
//    _age = age;
//}

@end
