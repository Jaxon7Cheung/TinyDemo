//
//  MathHelper.h
//  多态、静态类型和id类型
//
//  Created by 张旭洋 on 2024/4/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//编译时多态性
@interface MathHelper : NSObject

- (int)addInt:(int)a toInt:(int)b;
- (float)addFloat:(float)a toFloat:(float)b;

@end

NS_ASSUME_NONNULL_END
