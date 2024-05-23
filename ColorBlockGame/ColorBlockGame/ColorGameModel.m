//
//  ColorGameModel.m
//  ColorBlockGame
//
//  Created by 张旭洋 on 2024/2/3.
//

#import "ColorGameModel.h"

@implementation ColorGameModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.currentScore = 0;
        self.topScore = 0;
        self.level = 3;
        self.health = 3;
    }
    return self;
}


@end
