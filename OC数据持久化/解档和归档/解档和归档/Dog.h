//
//  Dog.h
//  解档和归档
//
//  Created by 张旭洋 on 2023/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject <NSCoding>

@property (nonatomic, copy)NSString* name;

@end

NS_ASSUME_NONNULL_END
