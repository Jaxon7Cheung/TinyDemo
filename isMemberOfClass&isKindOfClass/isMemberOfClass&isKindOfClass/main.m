//
//  main.m
//  isMemberOfClass&isKindOfClass
//
//  Created by 张旭洋 on 2024/7/20.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject

@end

@implementation Person

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL res1 = [[NSObject class] isKindOfClass: [NSObject class]];
        BOOL res2 = [[Person class] isKindOfClass: [Person class]];
        BOOL res3 = [[NSString class] isKindOfClass: [NSObject class]];
        
        NSLog(@"%d %d %d", res1, res2, res3);  // 1 0 1
        
        
        Person* person = [[Person alloc] init];
        BOOL res4 = [[Person class] isKindOfClass: [NSObject class]];
        BOOL res5 = [person isKindOfClass: [NSObject class]];
        NSLog(@"%d %d", res4, res5);  // 1 1
        
        
        //  获取一个类的元类的两种方式
//        Class objectMeta = objc_getMetaClass("NSObject");
        Class objectMeta = object_getClass([NSObject class]);
//        Class personMeta = objc_getClass("Person");
        Class personMeta = object_getClass([Person class]);
        
        
//        BOOL res6 = [[NSObject class] isMemberOfClass: objectMeta];
        BOOL res6 = [[NSObject class] isMemberOfClass: [NSObject class]];
        BOOL res7 = [person isMemberOfClass: [NSObject class]];
//        BOOL res8 = [[Person class] isMemberOfClass: personMeta];
        BOOL res8 = [[Person class] isMemberOfClass: [NSObject class]];
        BOOL res9 = [person isMemberOfClass: [Person class]];
        
        NSLog(@"%d %d %d %d" , res6, res7, res8, res9); // 0 0 0 1
    }
    return 0;
}
