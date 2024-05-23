//
//  Student.h
//  继承和派生的语法
//
//  Created by 张旭洋 on 2023/8/14.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : Person

@property (copy, nonatomic)NSString* stuID;

- (void)study;

@end

NS_ASSUME_NONNULL_END
