//
//  Person.h
//  成员变量的权限
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject {
    //限定成员变量的权限，而不是属性
    @protected        //受公共保护权限 默认权限
    NSInteger _numbersOfGF;
    @public           //公共权限
    NSString* _name;
    @private          //私有的 只能被当前类访问 也不能被子类访问
    NSInteger _passWord;
    @package          //了解 框架🫡 使成员变量在框架内访问 框架外不能访问
}

//属性自动生成的成员变量默认是私有权限
@property (copy, nonatomic)NSString* address;

//方法没有权限 如果方法被声明在.h文件中，那么方法就可以被外界访问
//不在.h中声明（.h文件没有公开），仅实现，就可以实现方法私有化
- (NSInteger)numbersOfGF;
- (void)setNumbersOfGF: (NSInteger)numbersOfGF;

- (void)test;
- (NSInteger)passWord;
- (void)setPassWord: (NSInteger)passWord;

@end

NS_ASSUME_NONNULL_END
