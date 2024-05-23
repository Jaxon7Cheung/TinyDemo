//
//  Manager.m
//  RGBARequestTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import "Manager.h"

@implementation Manager

static id manager = nil;

+ (instancetype)sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[Manager alloc] init];
        });
    }
    return manager;
}

- (void)requestRGBSetWithToken:(NSString *)token sucess:(RGBModelBlock)sucess {
    
}

@end
