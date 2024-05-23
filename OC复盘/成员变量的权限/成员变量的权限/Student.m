//
//  Student.m
//  成员变量的权限
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Student.h"

@implementation Student

- (void)test {
    //Instance variable '_passWord' is private
    //子类不能访问父类的私有成员变量
    //_passWord = 789;
    
    
    //_address = @"北京";
    //调用继承与于父类的setter/getter方法 间接访问父类的私有成员变量
    //说明：即便成员变量是私有的，也可以用setter/getter方法将其暴露出来
    self.address = @"北京";
}

@end
