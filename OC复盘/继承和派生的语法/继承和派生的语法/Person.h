//
//  Person.h
//  继承和派生的语法
//
//  Created by 张旭洋 on 2023/8/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (copy, nonatomic)NSString* name;
@property (assign, nonatomic)NSInteger age;

- (void)sayHello;

@end

NS_ASSUME_NONNULL_END
