//
//  Mom.h
//  协议
//
//  Created by 张旭洋 on 2023/10/8.
//

#import <Foundation/Foundation.h>
#import "Work.h"
#import "Chat.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mom : NSObject <Work, Chat>

@end

NS_ASSUME_NONNULL_END
