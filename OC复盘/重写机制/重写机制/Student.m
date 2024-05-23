//
//  Student.m
//  重写机制
//
//  Created by 张旭洋 on 2023/8/14.
//

#import "Student.h"

@implementation Student

- (void)haveMeeting {
    NSLog(@"学生正在开学生代表大会。");
}

//重写机制的应用场景

//子类完全实现父类的实现逻辑
- (void)play {
    NSLog(@"喜欢一个人玩");
}

//在父类的逻辑基础上新增一些逻辑
- (void)wakeUp {
    //先使用父类的实现逻辑起床
    [super wakeUp];
    //再在父类的实现逻辑之上，新增一些功能
    NSLog(@"背单词");
}

@end
