//
//  Student.h
//  复合类型
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Lesson.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (retain, nonatomic)Book* book;
@property (retain, nonatomic)Lesson* lesson;

- (void)showMessage;
- (instancetype)initWithBook: (Book *)book andLesson: (Lesson *)lesson;

@end

NS_ASSUME_NONNULL_END
