//
//  Monster.m
//  构造方法（init）
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Monster.h"

@implementation Monster

- (instancetype)initWithName:(NSString *)name andHP:(NSInteger)HP {
    self = [super init];
    if (self) {
        self.name = name;
        self.HP = HP;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ HP:%ld", self.name, self.HP];
}

@end
