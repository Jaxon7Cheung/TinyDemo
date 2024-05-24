//
//  main.m
//  NSKeyedArchiverTest
//
//  Created by 张旭洋 on 2023/11/22.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* person1 = [[Person alloc] init];
        person1.name = @"XY";
        person1.age = 20;
        person1.weight = 125.0;
        Dog* dog1 = [[Dog alloc] init];
        dog1.name = @"Bruce";
        person1.dog = dog1;
        
        
        Person* person2 = [[Person alloc] init];
        person2.name = @"Jacky";
        person2.age = 21;
        person2.weight = 130.0;
        Dog* dog2 = [[Dog alloc] init];
        dog2.name = @"Oudy";
        person2.dog = dog2;
        
        //创建归档对象
        NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc] initRequiringSecureCoding: NO];
        
        //进行归档操作
        [archiver encodeObject: person1 forKey: @"personOne"];
        [archiver encodeObject: person2 forKey: @"personTwo"];
        
        //将归档（序列化）后的数据写入指定文件中
        [archiver.encodedData writeToFile: @"/Users/jakey/Desktop/CS/Xcode/NSKeyedArchiverTest/test.archiver" atomically: YES];
        
        //结束归档
        [archiver finishEncoding];
        
        
        //解档
        NSData* data = [NSData dataWithContentsOfFile: @"/Users/jakey/Desktop/CS/Xcode/NSKeyedArchiverTest/test.archiver"];
        NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc] initForReadingFromData: data error: nil];
        unarchiver.requiresSecureCoding = NO;
        
        Person* unchiverPerson1 = [unarchiver decodeObjectForKey: @"personOne"];
        NSLog(@"%@ %d %lf %@", unchiverPerson1.name, unchiverPerson1.age, unchiverPerson1.weight, unchiverPerson1.dog.name);
        Person* unchiverPerson2 = [unarchiver decodeObjectForKey: @"personTwo"];
        NSLog(@"%@ %d %lf %@", unchiverPerson2.name, unchiverPerson2.age, unchiverPerson2.weight, unchiverPerson2.dog.name);
        
//        //归档成二进制数据流
//        NSError* error;
//        NSData* data1 = [NSKeyedArchiver archivedDataWithRootObject: person requiringSecureCoding: YES error: &error];
//        if (error) {
//            NSLog(@"归档错误：%@", error);
//            return 0;
//        }
//        //写入指定路径（一般写入到沙盒，这里方便演示存到一个新的文件夹）
//        [data1 writeToFile: @"/Users/jakey/Desktop/CS/Xcode/NSKeyedArchiverTest/test.archiver" atomically: YES];
//
//        //解档此二进制数据
//        error = nil;
//        NSData* data2 = [NSData dataWithContentsOfFile: @"/Users/jakey/Desktop/CS/Xcode/NSKeyedArchiverTest/test.archiver"];
//        Person* unarchiverPerson = (Person *)[NSKeyedUnarchiver unarchivedObjectOfClass: [Person class] fromData: data2 error: &error];
//        if (error) {
//            NSLog(@"解档错误：%@", error);
//        }
//        NSLog(@"unarchiverPerson：%@", unarchiverPerson);
    }
    return 0;
}
