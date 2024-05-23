//
//  Jackson.m
//  代理
//
//  Created by 张旭洋 on 2023/10/9.
//

#import "Jackson.h"

@implementation Jackson

- (void)askJaneForHelp {
    //Henry
    //[self.delegate buyTickets];
    
    //优化一下，更安全
    //判断对象是否能响应这个方法respondToSelector
    //if ([self.delegate respondsToSelector: @selector(buyTickets)]) {
        [self.delegate buyTickets];
    //}
}

@end
