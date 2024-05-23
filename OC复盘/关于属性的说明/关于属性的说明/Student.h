//
//  Student.h
//  关于属性的说明
//
//  Created by 张旭洋 on 2023/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject {
    NSInteger _height;
}/*{
    NSString* _name;
    NSInteger _age;
}*/

//如果添加了属性，却没有添加对应的成员变量，会自动生成一个对应成员变量
@property NSString* name;
@property NSInteger age;

- (NSInteger)height;
- (void)print;

@end

NS_ASSUME_NONNULL_END
