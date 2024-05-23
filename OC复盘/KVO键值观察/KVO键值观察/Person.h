//
//  Person.h
//  KVO键值观察
//
//  Created by 张旭洋 on 2023/10/14.
//

#import <Foundation/Foundation.h>
#import "Observer.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign)NSInteger age;

@property (nonatomic, strong)Observer* observer;

- (void)registerObserver;

@end

NS_ASSUME_NONNULL_END
