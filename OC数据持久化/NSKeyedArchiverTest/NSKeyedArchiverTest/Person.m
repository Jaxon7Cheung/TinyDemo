//
//  Person.m
//  NSKeyedArchiverTest
//
//  Created by 张旭洋 on 2023/11/22.
//

#import "Person.h"

@implementation Person

//归档
- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject: self.name forKey: @"name"];
    [coder encodeInt: self.age forKey: @"age"];
    [coder encodeDouble: self.weight forKey: @"weight"];
    [coder encodeObject: self.dog forKey: @"dog"];
}

//解档
- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey: @"name"];
        self.age = [coder decodeIntForKey: @"age"];
        self.weight = [coder decodeDoubleForKey: @"weight"];
        self.dog = [coder decodeObjectForKey: @"dog"];
    }
    
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
