//
//  Book.m
//  复合类型
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Book.h"

@implementation Book

- (NSString *)description {
    return [NSString stringWithFormat:@"book: name:%@ pages:%ld price:%ld", self.name, self.pages, self.price];
}

@end
