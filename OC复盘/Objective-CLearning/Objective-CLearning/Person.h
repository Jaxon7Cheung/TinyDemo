//
//  Person.h
//  Objective-CLearning
//
//  Created by 张旭洋 on 2023/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//类名不必和文件名严格一致
@interface Person : NSObject {
    //{}里的内容都是负责描述类的特有属性，称为成员变量
    double _height;
    double _weight;
}

//- 实例方法，+类方法
- (void)singSongs:(int)val;

@end

NS_ASSUME_NONNULL_END
