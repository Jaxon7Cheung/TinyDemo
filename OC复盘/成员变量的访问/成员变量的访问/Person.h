//
//  Person.h
//  成员变量的访问
//
//  Created by 张旭洋 on 2023/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject {
    char* _name;
    int _age;
}
//getter方法，都是带返回值，返回类型和访问的成员变量类型保持一致
- (int)age;

//setter方法，用来提供设置对象的成员变量
//无返回值
- (void)setAge: (int)age;

@end

NS_ASSUME_NONNULL_END
