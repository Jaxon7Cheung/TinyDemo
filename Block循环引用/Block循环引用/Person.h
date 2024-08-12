//
//  Person.h
//  Block循环引用
//
//  Created by 张旭洋 on 2024/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Block)(void);

@interface Person : NSObject

@property (nonatomic, copy)Block block;
@property (nonatomic, assign)int age;

- (void)test;

@end

NS_ASSUME_NONNULL_END
