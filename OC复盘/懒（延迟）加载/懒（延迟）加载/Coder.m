//
//  Coder.m
//  懒（延迟）加载
//
//  Created by 张旭洋 on 2023/8/10.
//

#import "Coder.h"

@implementation Coder

//重写getter方法
- (NSString *)girlFirend {
    if (_girlFirend == nil) {
        //节省内存开销 @"临时女朋友"可能是一个开销比较大的内存
        _girlFirend = @"临时女朋友";
    }
    return _girlFirend;
}

- (void)goHome {
    //NSLog(@"我要和我的%@一起回家", _girlFirend);
    //等到要回家（调用）时，才进而调用getter方法
    NSLog(@"我要和我的%@一起回家", self.girlFirend);
}

- (instancetype)initWithName: (NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"name:%@ girlFriend:%@", _name, _girlFirend];
}



@end
