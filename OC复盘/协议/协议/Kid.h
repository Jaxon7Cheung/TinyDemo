//
//  Kid.h
//  协议
//
//  Created by 张旭洋 on 2023/10/8.
//

#import <Foundation/Foundation.h>
#import "Play.h"
#import "Chat.h"

NS_ASSUME_NONNULL_BEGIN

//导入协议
@interface Kid : NSObject <Pla, Chat>

@end

NS_ASSUME_NONNULL_END
