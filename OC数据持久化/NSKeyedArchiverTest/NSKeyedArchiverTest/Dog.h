//
//  Dog.h
//  NSKeyedArchiverTest
//
//  Created by 张旭洋 on 2023/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject <NSSecureCoding>

@property (nonatomic, strong)NSString* name;

@end

NS_ASSUME_NONNULL_END
