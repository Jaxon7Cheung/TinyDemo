//
//  Student.h
//  属性关键字
//
//  Created by 张旭洋 on 2023/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property(assign, nonatomic, readwrite)NSInteger age;
@property(copy, nonatomic/*, readwrite*/) NSString* name;

@property(assign, /*nonatomic*,*/ readonly) NSInteger money;
@property(copy, nonatomic, setter=gNAME:, getter=gNAME) NSString* girlFriendName;

@end

NS_ASSUME_NONNULL_END
