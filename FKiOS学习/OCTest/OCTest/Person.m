//
//  Person.m
//  OCTest
//
//  Created by 张旭洋 on 2023/5/28.
//

#import "Person.h"

@implementation Person

- (id)initWithName: (NSString*)name andAge: (int)age {
    if (self = [super init]) {
        self.name = name;
        self->_age = age;
    }
    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat: @"<Person[_name=%@, _age=%d]>", self->_name, self.age];
}
@end
