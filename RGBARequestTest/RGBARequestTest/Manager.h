//
//  Manager.h
//  RGBARequestTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import <Foundation/Foundation.h>
#import "RGBAModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^RGBModelBlock)(RGBAModel* rgbModel);
typedef void(^ErrorBlock)(NSError* error);

@interface Manager : NSObject

+ (instancetype)sharedManager;
- (void)requestRGBSetWithToken: (NSString *)token sucess: (RGBModelBlock)sucess failure;

@end

NS_ASSUME_NONNULL_END
