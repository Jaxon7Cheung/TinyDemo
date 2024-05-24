//
//  main.m
//  解档和归档
//
//  Created by 张旭洋 on 2023/9/7.
//

//iOS 本地存储：plist属性列表，归档，sqlite，coredata

//归档：

#import <Foundation/Foundation.h>
#import "Person.h"

void archiveTest(void) {
//    Person* person = [[Person alloc] init];
//    person.name = @"XY";
//    person.age = 20;
//    person.weight = 125.0;
    
    Person* person1 = [[Person alloc] init];
    person1.name = @"XY";
    person1.age = 20;
    person1.weight = 125.0;
    
    Person* person2 = [[Person alloc] init];
    person2.name = @"ZA";
    person2.age = 19;
    person2.weight = 130.0;
    
    Person* person3 = [[Person alloc] init];
    person3.name = @"BC";
    person3.age = 21;
    person3.weight = 135.0;
    
    NSMutableData* data = [NSMutableData data];
    
    //根据二进制流创建归档对象
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData: data];
    //对对象进行归档操作
    [archiver encodeObject: person1 forKey: @"person1"];
    [archiver encodeObject: person2 forKey: @"person2"];
    [archiver encodeObject: person3 forKey: @"person3"];
    //结束归档
    [archiver finishEncoding];
    
    //NSArray* array = @[person1, person2, person3];
    
//    Dog* dog = [[Dog alloc] init];
//    dog.name = @"Oudy";
//    person.dog = dog;
    
    BOOL isSuccess = [data writeToFile:@"/Users/jakey/Desktop/CS/Xcode/解档和归档/archiveTest.txt" atomically: YES];
//    BOOL isSuccess = [NSKeyedArchiver archiveRootObject: person1 toFile: @"/Users/jakey/Desktop/CS/Xcode/解档和归档/archiveTest.txt"];
    if (isSuccess) {
        NSLog(@"归档成功");
    } else {
        NSLog(@"归档失败");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //成功归档后，注释掉
        //archiveTest();
        //解档
//        NSArray* array = [NSKeyedUnarchiver unarchiveObjectWithFile: @"/Users/jakey/Desktop/CS/Xcode/解档和归档/archiveTest.txt"];
        
        //NSLog(@"%@ %d %f", person.name, person.age, person.weight);
        //NSLog(@"%@ %d %f %@", person.name, person.age, person.weight, person.dog.name);
        
//        for (Person* person in array) {
//            NSLog(@"%@ %d %f", person.name, person.age, person.weight);
//        }
        
        NSData* data = [NSData dataWithContentsOfFile: @"/Users/jakey/Desktop/CS/Xcode/解档和归档/archiveTest.txt"];
        NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData: data];
        
        Person* person1 = [unarchiver decodeObjectForKey: @"person1"];
        Person* person2 = [unarchiver decodeObjectForKey: @"person2"];
        Person* person3 = [unarchiver decodeObjectForKey: @"person3"];
        
        [unarchiver finishDecoding];
        
        NSLog(@"%@ %d %f", person1.name, person1.age, person1.weight);
        NSLog(@"%@ %d %f", person2.name, person2.age, person2.weight);
        NSLog(@"%@ %d %f", person3.name, person3.age, person3.weight);
        
    }
    return 0;
}
