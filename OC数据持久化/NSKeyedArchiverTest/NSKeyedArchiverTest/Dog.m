//
//  Dog.m
//  NSKeyedArchiverTest
//
//  Created by 张旭洋 on 2023/11/23.
//

#import "Dog.h"

@implementation Dog

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject: self.name forKey: @"dogName"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey: @"dogName"];
    }
    
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
