//
//  main.m
//  字符串简介
//
//  Created by 张旭洋 on 2023/8/13.
//

#import <Foundation/Foundation.h>

void showStr(NSString* string) {
    NSLog(@"%@", string);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSString* string1 = @"XY";  //常量字符串当对象处理，但并不是真正的字符串，不是动态分配的
        //NSString* string2 = [[NSString alloc] initWithString: @"XY"];
        //NSString* string2 = [[NSString alloc] stringWithString: @"XY"];
        NSString* string3 = [NSString stringWithString: string1];
        
        //不可变字符串
        [string1 stringByAppendingString: @"Hello!"];
        showStr(string1);
        //实际生成一个新的字符串，搞了一块新内存（XY Hello），这块新内存就需要新的指针去访问
        NSString* newString = [string1 stringByAppendingString: @" Hello!"];
        showStr(newString);
        NSLog(@"%ld", newString.length);
        
        //内存结构可被修改的字符串
        //可变字符串
        NSMutableString* mString = [[NSMutableString alloc] init];
        NSMutableString* mString2 = [[NSMutableString alloc] initWithString: @"ZXY"];
        NSMutableString* mString3 = [NSMutableString stringWithString: @"JC"];
        //拼接新的字符串
        [mString appendString: @"Fu*k "];
        showStr(mString);
        [mString appendString: @"sh*t"];
        showStr(mString);
        
        //求字符串的长度
        NSLog(@"string1Len=%ld", string1.length);
        NSLog(@"mStringLen=%ld", mString.length);
        
        //汉语...一个字表示一个单位长度
        NSString* cString = @"情深深雨濛濛";
        NSLog(@"cStringLen=%ld", cString.length);
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
