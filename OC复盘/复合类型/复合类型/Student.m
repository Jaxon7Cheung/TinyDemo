//
//  Student.m
//  复合类型
//
//  Created by 张旭洋 on 2023/8/15.
//

#import "Student.h"

@implementation Student

- (void)showMessage {
//    NSLog(@"book: name:%@ pages:%ld price:%ld", self.book.name, self.book.pages, self.book.price);
//    NSLog(@"lesson: name:%@ hours:%ld", self.lesson.name, self.lesson.hours);
    NSLog(@"\n%@\n%@", self.book, self.lesson);
}

- (instancetype)initWithBook:(Book *)book andLesson:(Lesson *)lesson {
    self = [super init];
    if (self) {
        self.book = book;
        self.lesson = lesson;
    }
    return self;
}

@end
