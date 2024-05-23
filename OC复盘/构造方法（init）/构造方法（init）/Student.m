//
//  Student.m
//  构造方法（init）
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Student.h"

@implementation Student

//实例方法
//instancetype  <-- id泛型类型，类似于void*万能指针 前者对应对象类型，后者对应基本数据类型
//id可作为参数类型使用 instancetype不可作为参数类型使用

- (instancetype)init {
    /*
     self 指针 总是指向当前调用该方法的对象
     super 不是指针 并不表示对象 调用父类方法的关键字
     */
    //先使用父类的初始化方法，如果初始化成功，在进行子类初始化
    self = [super init];
    if (self) {
        self.name = @"Henry";
        self.age = 24;
    }
    return self;
}

@end
