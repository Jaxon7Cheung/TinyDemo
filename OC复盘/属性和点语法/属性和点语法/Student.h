//
//  Student.h
//  属性和点语法
//
//  Created by 张旭洋 on 2023/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject //{
    //NSString* _name;
    ///int _age;
    //NSInteger _age;
    //Foundation框架里面提供的一种类型
//#if __LP64__ || NS_BUILD_32_LIKE_64
//typedef long NSInteger;
//typedef unsigned long NSUInteger;
//#else
//typedef int NSInteger;
//typedef unsigned int NSUInteger;
//#endif
    ///我们可以看到这是一个预编译系统，会根据操作系统（iOS系统在，5s之前都是32位，之后是64位）在不同环境下赋予Integer整数不同的位数。
    ///所以是为了适配而设置了NSInteger，不管系统是32位还是64位，用NSInteger的话系统就会帮我们识别从而确定是long还是int。
//}

//合成存取器 name/age就是属性
///属性和成员变量的关系？属性是为成员变量服务的
///一个对象存储数据，描述对象特征的是成员变量，不是属性
///属性只是在成员变量的基础之上衍生的一种快捷的访问方式
///分配好一个对象，真正占内存的是成员变量，不是属性
//使用property关键字自动添加一对setter/getter方法
@property NSString* name;
@property NSInteger age;

//- (NSString *)name;
//- (void)setName: (NSString *)name;
//- (NSInteger)age;
//- (void)setAge: (NSInteger)age;


@end

NS_ASSUME_NONNULL_END
