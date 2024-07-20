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

@interface Teacher : NSObject

@end

@implementation Teacher

@end

void testInstanceMethods(void) {
    
    Person *person = [Person alloc];
    Class pClass = [Person class];
    Class objCls = [NSObject class];
    
    BOOL re1 = [person isKindOfClass: pClass];
    BOOL re2 = [person isKindOfClass: objCls];
    BOOL re3 = [person isMemberOfClass: pClass];
    BOOL re4 = [person isMemberOfClass: objCls];
    // 打印结果: 1110
    NSLog(@"\n re1 :%hhd\n re2 :%hhd\n re3 :%hhd\n re4 :%hhd\n",re1,re2,re3,re4);
}

void testClassMethods(void)  {
    
    Class tClass = [Teacher class];
    Class objCls = [NSObject class];
    id pMetaClass = objc_getMetaClass("Person");
    id tMetaClass = objc_getMetaClass("Teacher");
    
    BOOL re1 = [tClass isKindOfClass: tClass];
    BOOL re2 = [tClass isKindOfClass: tMetaClass];
    BOOL re3 = [tClass isKindOfClass: pMetaClass];
    BOOL re4 = [tClass isKindOfClass: objCls];
    
    BOOL re5 = [tClass isMemberOfClass:tMetaClass];
    BOOL re6 = [tClass isMemberOfClass:pMetaClass];
    // 打印结果: 011110
    NSLog(@"\n re1 :%hhd\n re2 :%hhd\n re3 :%hhd\n re4 :%hhd\n re5 :%hhd\n re6 :%hhd\n",re1,re2,re3,re4,re5,re6);
}

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
