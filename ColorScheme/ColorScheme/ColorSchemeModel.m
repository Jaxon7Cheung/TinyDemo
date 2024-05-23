//
//  ColorSchemeModel.m
//  ColorScheme
//
//  Created by 张旭洋 on 2024/3/23.
//

#import "ColorSchemeModel.h"

@implementation ColorSchemeModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameArray = [[NSMutableArray alloc] init];
        self.rgbArray = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
