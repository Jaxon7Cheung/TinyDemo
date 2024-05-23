//
//  Jane.h
//  代理
//
//  Created by 张旭洋 on 2023/10/9.
//

#import <Foundation/Foundation.h>
#import "Buy.h"

NS_ASSUME_NONNULL_BEGIN

//委托对象 必须实现委托方法
@interface Jane : NSObject <Buy>

@end

NS_ASSUME_NONNULL_END
