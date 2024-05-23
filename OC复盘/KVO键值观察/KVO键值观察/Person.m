//
//  Person.m
//  KVO键值观察
//
//  Created by 张旭洋 on 2023/10/14.
//

#import "Person.h"

@implementation Person

//关闭对对象监听的KVO
//这个方法是根据属性自动生成的
+ (BOOL)automaticallyNotifiesObserversOfAge {
    return NO;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    BOOL isOpen = YES;
    
    //如果是age就不监听了
    if ([key isEqualToString: @"age"]) {
        isOpen = NO;
    }
    
    return isOpen;
}

//手动设置KVO
- (void)setAge:(NSInteger)age {
    [self willChangeValueForKey: @"age"];
    self.age = age;
    [self didChangeValueForKey: @"age"];
}

- (void)registerObserver {

    //注册被观察者
    [self addObserver: self.observer forKeyPath: @"age" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: nil];
}

- (void)dealloc {
    [self removeObserver: self.observer forKeyPath: @"age"];
}

@end


