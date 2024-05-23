//
//  Jackson.h
//  代理
//
//  Created by 张旭洋 on 2023/10/9.
//

#import <Foundation/Foundation.h>
#import "Buy.h"

NS_ASSUME_NONNULL_BEGIN

@interface Jackson : NSObject

//代理这块儿用weak why
@property (nonatomic, weak) id<Buy> delegate;

- (void)askJaneForHelp;

@end

NS_ASSUME_NONNULL_END
