//
//  main.m
//  Block变量
//
//  Created by 张旭洋 on 2023/10/18.
//

#import <Foundation/Foundation.h>

int _age = 10;
static int _height = 175;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //static int age = 10;
        NSLog(@"%d %p", _age, &_age);
        void(^blockName)(void) = ^ {
            _age = 30;
            NSLog(@"%d %p", _age, &_age);
        };
//        _age = 20;
        //可以打印出来，说明block块是可以访问到外部信息的
        blockName();
        _age = 20;
        NSLog(@"%d %p", _age, &_age);
        
        //block内部只能调用外部全局变量，不能修改
//        int age = 10;
//        int(^blockName)(void) = ^ {
//            int a = 20;
//            int b = 30;
//            //age = 40;
//            return a + b + age;
//        };
//        int result = blockName();
//        NSLog(@"%d", result);
        
        //当变量被__block修饰时，block可以修改外部全局变量的内容
//        __block int age = 10;
//        int(^blockName)(void) = ^ {
//            int a = 20;
//            int b = 30;
//            age = 40;
//            return a + b + age;
//        };
//        int result = blockName();
//        NSLog(@"%d", result);
        
//        int age = 10;
//        NSLog(@"%d %p", age, &age);
//        void(^blockName)(void) = ^ {
//            //捕获ta的上层全局变量
//            //copy了一份放在新开辟的一块内存中 const指针指向 解释了里面的值不能修改
//            NSLog(@"%d", age);
//            NSLog(@"%d %p", age, &age);
//        };
//        age = 30;
//        blockName();  //打印
//        NSLog(@"%d %p", age, &age);
        
        
//        //了解
//        //__block 对block说，不要去copy我，在栈区又开辟一块内存
//        //block的age引用的是栈区的地址
//        __block int age = 10;
//        NSLog(@"%d %p", age, &age);
//        void(^blockName)(void) = ^ {
//
//            NSLog(@"%d", age);
//            NSLog(@"%d %p", age, &age);
//        };
//        age = 30;
//        blockName();  //打印
//        NSLog(@"%d %p", age, &age);
    }
    return 0;
}
