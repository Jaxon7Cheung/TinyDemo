//
//  Singleton.m
//  单例模式
//
//  Created by 张旭洋 on 2023/9/12.
//

#import "Singleton.h"

//创建一个全局变量

@implementation Singleton

//static Singleton* instanceVariable = nil;

//+ (instancetype)sharedInstance {
//
//    //判断对象是否存在，若不存在，创建对象
//    if (!instanceVariable) {
//
//        //线程安全：仅仅只让一个线程进行，一个线程结束后，才能进行另一个线程
//        @synchronized (self) {
//            if (!instanceVariable) {
//                instanceVariable = [[Singleton alloc] init];
//            }
//        }
//    }
//
//    return instanceVariable;
//
//}

//+ (instancetype)sharedInstance {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instanceVariable = [[Singleton alloc] init];
//        //instanceVariable = [[self alloc] init];
//    });
//
//    return instanceVariable;
//}

static Singleton* person = nil;

+ (instancetype)defaultPerson {
    if (!person) {
        person = [[super allocWithZone: NULL] init];
    }
    return person;
}

//重写
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self defaultPerson];
}

- (id)copy {
    return self;
}

- (oneway void)release {
    //不写
}

- (instancetype)autorelease {
    return self;
}

- (NSUInteger)retainCount {
    return NSIntegerMax;
}


@end
