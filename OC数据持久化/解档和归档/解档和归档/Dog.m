//
//  Dog.m
//  解档和归档
//
//  Created by 张旭洋 on 2023/9/10.
//

#import "Dog.h"

@implementation Dog

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject: self.name forKey: @"name"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey: @"name"];
    }
    return self;
}

@end
