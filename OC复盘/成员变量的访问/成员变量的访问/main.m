//
//  main.m
//  成员变量的访问
//
//  Created by 张旭洋 on 2023/8/10.
//

#import <Foundation/Foundation.h>
#import "Person.h"

struct Student {
    char* name;
    int age;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Student s = {"JY", 18};
        printf("name:%s age:%d\n", s.name, s.age);
        struct Student* ps = (struct Student*)malloc(sizeof(struct Student));
        ps->name = "XY";
        ps->age = 20;
        printf("name:%s age:%d\n", ps->name, ps->age);
        
        //对象的成员变量默认是受保护的
        //init系统自带的初始化方法，默认是给基本数据类型赋值为0或0.0，指针赋值为NULL，对象指针赋值为nil（给对象指针赋空值用的）˚blog˚
        Person* jakeyZ = [[Person alloc] init];
        //Instance variable '_height' is protected
//        jakeyZ->_age = 18;
        
        //既然对象的成员变量有访问的权限，那如何公开这个权限？
        // setter/getter方法
        
        //使用setter方法给jakeyZ的年龄赋值
        [jakeyZ setAge: 20];
        
        //向jakeyZ这个对象发送一个消息（即age方法）
        //使用getter方法访问jakeyZ的年龄
        int jakeyZsAge = [jakeyZ age];
        NSLog(@"%d", jakeyZsAge);
        
        
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
