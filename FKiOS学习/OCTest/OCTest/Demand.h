//
//  Demand.h
//  OCTest
//
//  Created by 张旭洋 on 2023/5/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Demand <NSObject>
@required
- (void)caculate: (int)iOS plusWeb: (int)web;
@optional
- (void)unecessary;
@end
NS_ASSUME_NONNULL_END
