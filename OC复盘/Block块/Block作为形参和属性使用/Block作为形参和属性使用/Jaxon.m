//
//  Jaxon.m
//  Block作为形参和属性使用
//
//  Created by 张旭洋 on 2023/10/17.
//

#import "Jaxon.h"

@implementation Jaxon

- (void)askMyselfDo {
    self.helpBlock(5);
}

//- (void)askJackyForHelp:(void (^)(int num))block {
//    block(3);
//}

- (void)askJackyForHelp:(void (^)(int))block isOK:(void (^)(BOOL))completion {
    block(3);
    completion(arc4random() % 2);
}

- (void)askJackyForHelp2:(Help)block isOK:(Finish)completion {
    block(4);
    completion(1);
}

@end
