//
//  Play.h
//  协议
//
//  Created by 张旭洋 on 2023/10/8.
//

#import <Foundation/Foundation.h>

//@protocol 协议名 <父协议> 一般父协议都是<NSObject>

NS_ASSUME_NONNULL_BEGIN

@protocol Pla <NSObject>

//写一组方法
/*
 @optional
 @required 默认的
 */
@optional
- (void)playGames;

@end

NS_ASSUME_NONNULL_END
