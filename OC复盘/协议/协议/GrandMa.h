//
//  GrandMa.h
//  协议
//
//  Created by 张旭洋 on 2023/10/8.
//

#import <Foundation/Foundation.h>
#import "Dad.h"
#import "Mom.h"

//id<talk>

NS_ASSUME_NONNULL_BEGIN

@interface GrandMa : NSObject

//@property (nonatomic, strong)Dad* dad;
//@property (nonatomic, strong)Mom* mom;

//实现这个协议的对象都可以复制给此属性
@property (nonatomic, strong)id<Chat> fam;

- (void)chatWithMyChild;

@end

NS_ASSUME_NONNULL_END
