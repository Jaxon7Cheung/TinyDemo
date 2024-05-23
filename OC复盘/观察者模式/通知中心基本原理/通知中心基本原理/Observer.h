//
//  Observer.h
//  通知中心基本原理
//
//  Created by 张旭洋 on 2023/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Observer : NSObject

- (void)registerNotification;

@end

NS_ASSUME_NONNULL_END
