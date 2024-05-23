//
//  main.m
//  多态、静态类型和id类型
//
//  Created by 张旭洋 on 2023/8/16.
//

#import <Foundation/Foundation.h>
#import "Coder.h"
#import "Photographer.h"
#import "Teacher.h"

#import "MathHelper.h"
#import "Dog.h"
#import "Cat.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //多态:指的是同一个类型或接口的实例在不同情况下展现出不同的行为的能力。
        
        //在编译时，编译器会根据方法的声明确定调用的具体方法。
        MathHelper* mathHelper = [[MathHelper alloc] init];
        int intResult = [mathHelper addInt: 3 toInt: 5];
        float floatResult = [mathHelper addFloat: 3.7 toFloat: 5.7];
        NSLog(@"Int: %d, Float: %f", intResult, floatResult);
        
        //在运行时，根据对象的实际类型确定调用的具体方法，实现了运行时多态性的特性。
//        Dog* animal = (Dog *)[[Animal alloc] init];
        Animal* animal = [[Animal alloc] init];
        Animal* dog = [[Dog alloc] init];
        Animal* cat = [[Cat alloc] init];
        [animal makeSound];
        [dog makeSound];
        [cat makeSound];
        
        
        //了解了什么是多态:指的是同一个类型或接口的实例在不同情况下展现出不同的行为的能力。
        Coder* coder = [[Coder alloc] init];
        Photographer* photographer = [[Photographer alloc] init];
//        [coder invite];
//        [photographer invite];
        Teacher* teacher = [[Teacher alloc] init];
        Coder* henry = [[Coder alloc] init];
        
        id interViewer = nil;
        //id value = 5; //不能表示非对象类型
        interViewer = henry;
        //系统自动追踪interViewer的所属类型
        //动态绑定：确定一个对象类型后，进而去确定调用方法是所属于哪个类的过程
        [interViewer haveInterview];
        interViewer = teacher;
        [interViewer haveInterview];
        
        /*
         动态类型 id
         静态类型 Coder* Teacher* Photographer*
         */
        
        //Thread 1: "-[Teacher coding]: unrecognized selector sent to instance 0x600000008020"
//        [interViewer coding]; //动态类型 不能在编译时查错
        
        //No visible @interface for 'Teacher' declares the selector 'coding'
//        [teacher coding]; //直接报错
        /*
         1.静态类型更容易在编译时而不是运行时查错
         2.可读性强
         */
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
