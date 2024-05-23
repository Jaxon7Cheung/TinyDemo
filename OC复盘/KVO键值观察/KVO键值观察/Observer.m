//
//  Observer.m
//  KVO键值观察
//
//  Created by 张旭洋 on 2023/10/14.
//

#import "Observer.h"

@implementation Observer

//观察者接收被观察者的变化
//只要被观察者发生变化，就会调用此方法
/*
 - 对于任何类型的属性（属性、一对一关系、或有序或无序对多关系） NSKeyValueChangeSetting 指示被观察对象已收到 -setValue:forKey: 消息，或者符合键值编码的 set 方法 已调用该密钥，或者已调用 -willChangeValueForKey:/-didChangeValueForKey:
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    //被观察者的键 被观察者对象 change
    NSLog(@"keyPath:%@ object:%@ change:%@", keyPath, object, change);
}

@end
