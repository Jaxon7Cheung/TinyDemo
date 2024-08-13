//
//  ViewController.m
//  RunLoop学习
//
//  Created by 张旭洋 on 2024/8/13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSArray* array;
//    CFArrayRef arrayRef;
//    NSString* string;
//    CFStringRef stringRef;
    
    NSRunLoop* currentRunLoop = [NSRunLoop currentRunLoop];
    NSRunLoop* mainRunLoop = [NSRunLoop mainRunLoop];
    
    CFRunLoopRef currentRunLoopCF = CFRunLoopGetCurrent();
    CFRunLoopRef mainRunLoopCF = CFRunLoopGetMain();
    
    NSLog(@"current: %p %p", currentRunLoop, currentRunLoopCF);
    NSLog(@"main: %p %p", mainRunLoop, mainRunLoopCF);
//    (CFRunLoopRef) 0x0000600003708000
    
    // 有序的
//    NSMutableArray* array;
//    [array addObject: @"123"];
//    NSLog(@"%@", array[0]);
    
    // 无序的
//    NSMutableSet* set;
//    [set addObject: @"qwe"];
//    NSLog(@"%@", [set anyObject]);
    
    NSLog(@"%@", [NSRunLoop currentRunLoop]);
    
    // 事件是通过source1捕捉分发给sourcr0，由source0来处理的
}


@end
