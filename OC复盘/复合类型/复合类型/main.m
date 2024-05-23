//
//  main.m
//  复合类型
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Book.h"
#import "Lesson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Book* book = [[Book alloc] init];
        book.name = @"代码美学";
        book.pages = 789;
        book.price = 55;
        Book* book1 = [[Book alloc] init];
        book1.name = @"多线程管理";
        book1.pages = 579;
        book1.price = 66;
        
        Lesson* lesson = [[Lesson alloc] init];
        lesson.name = @"Objective-C";
        lesson.hours = 24;
        
        //Student* student = [[Student alloc] initWithBook: book andLesson: lesson];
        Student* student = [[Student alloc] init];
        student.book = book1;
        student.lesson = lesson;
        
        //只负责成员变量的变化，不去管成员变量的成员变量的...一级管一级，这样更能体现面向对象思想
//        student.book.name = @"程序员的自我修养";
//        student.book.pages = 798;
//        student.lesson.name = @"iOS";
//        student.lesson.hours = 48;
        [student showMessage];
        
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
