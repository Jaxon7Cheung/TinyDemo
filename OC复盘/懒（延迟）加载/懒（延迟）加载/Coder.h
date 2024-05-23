//
//  Coder.h
//  懒（延迟）加载
//
//  Created by 张旭洋 on 2023/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Coder : NSObject

@property (copy, nonatomic)NSString* name;
@property (copy, nonatomic)NSString* girlFirend;

- (instancetype)initWithName: (NSString *)name;

- (void)goHome;

@end

NS_ASSUME_NONNULL_END
