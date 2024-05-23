//
//  Hero.m
//  析构函数
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Hero.h"

@implementation Hero

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Hero对象正在被创建");
    }
    return self;
}

//析构函数。当对象内存被销毁的时候，自动调用，永远不需要手动调用这个函数
//同样不允许被显示调用
- (void)dealloc {
    //释放子类资源
    NSLog(@"Hero对象正在被释放");
    //再释放一次父类的资源
    //ARC forbids explicit message send of 'dealloc'
    //ARC已经帮忙做了
    [super dealloc];
    //Method possibly missing a [super dealloc] call
    //关掉ARC后就可以手动释放父类资源
}


@end
