//
//  Monster.h
//  构造方法（init）
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Monster : NSObject

@property (copy, nonatomic)NSString* name;
@property (assign, nonatomic)NSInteger HP;

//NSObject init
/*
 构造方法的语法规则
 1.返回值类型必须为instancetype
 2.必须以init打头
 3.带参数应以With...开始 initWith...
 4.实例方法
 */
- (instancetype)initWithName: (NSString *)name andHP: (NSInteger)HP;

@end

NS_ASSUME_NONNULL_END
