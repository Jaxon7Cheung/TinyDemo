//
//  THGSingleton.m
//  OCTest
//
//  Created by 张旭洋 on 2023/5/26.
//

#import "THGSingleton.h"

@implementation THGSingleton
static id instance = nil;

+ (id)instance {
    if (!instance) {
        instance = [[super alloc] init];
    }
    return instance;
}

@end
