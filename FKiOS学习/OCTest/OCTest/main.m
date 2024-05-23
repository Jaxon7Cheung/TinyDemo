//
//  main.m
//  OCTest
//
//  Created by 张旭洋 on 2023/5/26.
//

//#import <Foundation/Foundation.h>
#import "THGSingleton.h"
#import "Person.h"
#import "XiyouMobilePerson.h"
#import "Model.h"
#import "Demand.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Model* myModel = [[Model alloc] init];
//        myModel.xiyouMobileArray = [NSMutableArray arrayWithObjects: [[XiyouMobilePerson alloc] initWithName: @"one" andAge: 1], [[XiyouMobilePerson alloc] initWithName: @"two" andAge: 2], [[XiyouMobilePerson alloc] initWithName: @"three" andAge: 3], [[XiyouMobilePerson alloc] initWithName: @"four" andAge: 4], [[XiyouMobilePerson alloc] initWithName: @"five" andAge: 5], nil];
        XiyouMobilePerson* s1 = [[XiyouMobilePerson alloc] initWithName: @"one" andAge: 1];
        s1.iOS = 1;
        s1.web = 1;
        s1.android = @"1";
        s1.server = @"1";
        XiyouMobilePerson* s2 = [[XiyouMobilePerson alloc] initWithName: @"two" andAge: 2];
        s2.iOS = 2;
        s2.web = 2;
        s2.android = @"2";
        s2.server = @"2";
        XiyouMobilePerson* s3 = [[XiyouMobilePerson alloc] initWithName: @"three" andAge: 3];
        s3.iOS = 3;
        s3.web = 3;
        s3.android = @"3";
        s3.server = @"3";
        XiyouMobilePerson* s4 = [[XiyouMobilePerson alloc] initWithName: @"four" andAge: 4];
        s4.iOS = 4;
        s4.web = 4;
        s4.android = @"4";
        s4.server = @"4";
        XiyouMobilePerson* s5 = [[XiyouMobilePerson alloc] initWithName: @"five" andAge: 5];
        s5.iOS = 5;
        s5.web = 5;
        s5.android = @"5";
        s5.server = @"5";
        
        myModel.xiyouMobileArray = [NSMutableArray arrayWithObjects: s1, s2, s3, s4, s5, nil];
        NSEnumerator* en = [myModel.xiyouMobileArray objectEnumerator];  //顺序枚举器
        XiyouMobilePerson* max = s1;
        XiyouMobilePerson* i;
        while (i = [en nextObject]) {
            if (i.iOS > max.iOS) {
                max = i;
            }
        }
        NSLog(@"iOS变量值最大的对象的相关信息：%@ %d %d %d %@ %@", max.name, max.age, max.iOS, max.web, max.android, max.server);
        [myModel.xiyouMobileArray removeObjectsInRange: NSMakeRange(2, 3)];
        NSLog(@"%@", myModel.xiyouMobileArray);
        
        NSLog(@"%d", [THGSingleton instance] == [THGSingleton instance]);
    }
    return 0;
}
