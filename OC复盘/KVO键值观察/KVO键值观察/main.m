//
//  main.m
//  KVO键值观察
//
//  Created by 张旭洋 on 2023/10/14.
//

//key - valued - observer 键值观察

/*
 1. 注册被观察者
 2. 观察者接收被观察者值的变化
 3. 不使用时一定记得remove掉
*/
//  由于KVO的实现机制，只针对属性才会发生作用，一般继承NSObject的对象都默认支持KVO

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Observer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Observer观察Person
        
        //注册观察者
        Person* person = [[Person alloc] init];
        Observer* observer = [[Observer alloc] init];       
        person.observer = observer;
        [person registerObserver];
        
        person.age = 17;
        person.age = 27;
        person.age = 37;
         
    }
    return 0;
}
