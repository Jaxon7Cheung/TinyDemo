//
//  Singleton.h
//  单例模式
//
//  Created by 张旭洋 on 2023/9/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

//创建类方法，返回对象实例
//以shared、default、current开头的方法一般都是单例

//+ (instancetype)sharedInstance;

+ (instancetype)defaultPerson;

@end

NS_ASSUME_NONNULL_END
