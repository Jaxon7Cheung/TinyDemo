//
//  TestModel.m
//  JSONModelTest
//
//  Created by 张旭洋 on 2023/10/22.
//

#import "TestModel.h"

@implementation Top_StoriesModel

//JSONModel库提供的一个类方法，用于指定属性是否可选（optional）
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation StoriesModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
    
}
@end

@implementation TestModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
