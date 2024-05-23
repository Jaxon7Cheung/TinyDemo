//
//  Lesson.m
//  复合类型
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Lesson.h"

@implementation Lesson

- (NSString *)description {
    return [NSString stringWithFormat:@"lesson: name:%@ hours:%ld", self.name, self.hours];
}

@end
