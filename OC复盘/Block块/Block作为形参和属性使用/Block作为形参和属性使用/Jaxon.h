//
//  Jaxon.h
//  Block作为形参和属性使用
//
//  Created by 张旭洋 on 2023/10/17.
//

/*
 block作为形参
 
 (返回值类型 (^) (block形参列表)) 形参名称
 
 (void(^)(void))block
 
 block块作为形参尽量放到方法参数列表的尾部
 */

/*
 typedef 返回值类型(^block别名)(形参列表)
 */

#import <Foundation/Foundation.h>

typedef void(^Help)(int num);
typedef void(^Finish)(BOOL isOK);

NS_ASSUME_NONNULL_BEGIN

@interface Jaxon : NSObject

//把Block理解为一种对象或者数据类型

//没有别名
@property (nonatomic, copy)void(^helpBlock)(int num);
//有别名
//@property (nonatomic, copy)Help helpBlock;
- (void)askMyselfDo;

//- (void)askJackyForHelp: (void(^)(int num))block;
- (void)askJackyForHelp: (void(^)(int num))block isOK: (void(^)(BOOL boolValue))completion;

- (void)askJackyForHelp2:(Help)block isOK:(Finish)completion;

@end

NS_ASSUME_NONNULL_END
