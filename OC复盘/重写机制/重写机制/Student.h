//
//  Student.h
//  重写机制
//
//  Created by 张旭洋 on 2023/8/14.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : Person

//子类不需要声明父类已经声明过的方法
//- (void)haveMeeting;

@end

NS_ASSUME_NONNULL_END
