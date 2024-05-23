//
//  Client.m
//  通知中心基本原理
//
//  Created by 张旭洋 on 2023/10/14.
//

#import "Client.h"

@implementation Client

- (void)postNotification {
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    
    NSDictionary* message = @{@"name" : @"Jaxon"};
    [center postNotificationName: @"Observer" object: self userInfo: message];
}

@end
