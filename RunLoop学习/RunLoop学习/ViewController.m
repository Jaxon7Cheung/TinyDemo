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

// 监听回调函数
void observeRunLoopActicities(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"kCFRunLoopBeforeTimers");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"kCFRunLoopBeforeSources");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"kCFRunLoopBeforeWaiting");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"kCFRunLoopAfterWaiting");
            break;
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit");
            break;
        default:
            break;
    }
}

/* Run Loop Observer Activities */
//    typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
//        kCFRunLoopEntry = (1UL << 0),         // 即将进入Loop
//        kCFRunLoopBeforeTimers = (1UL << 1),  // 即将处理Timer
//        kCFRunLoopBeforeSources = (1UL << 2), // 即将处理Source
//        kCFRunLoopBeforeWaiting = (1UL << 5), // 即将进入休眠
//        kCFRunLoopAfterWaiting = (1UL << 6),  // 刚从休眠中唤醒
//        kCFRunLoopExit = (1UL << 7),          // 即将退出RunLoop
//        kCFRunLoopAllActivities = 0x0FFFFFFFU
//    };
void blockCallBack(void) {
    // 通过block回调来监听
    /*
    CFRunLoopObserverRef observerWithHandler = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopEntry - %@", mode);
                CFRelease(mode);
                break;
            }
                
            case kCFRunLoopBeforeTimers: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopBeforeTimers - %@", mode);
                CFRelease(mode);
                break;
            }
                
            case kCFRunLoopBeforeSources: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopBeforeSources - %@", mode);
                CFRelease(mode);
                break;
            }
                
            case kCFRunLoopBeforeWaiting: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopBeforeWaiting - %@", mode);
                CFRelease(mode);
                break;
            }
                
            case kCFRunLoopAfterWaiting: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopAfterWaiting - %@", mode);
                CFRelease(mode);
                break;
            }
                
            case kCFRunLoopExit: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopExit - %@", mode);
                CFRelease(mode);
                break;
            }
                
            default:
                break;
        }
    });
     */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView* textView = [[UITextView alloc] initWithFrame: CGRectMake(77, 77, 97, 87)];
    textView.backgroundColor = [UIColor cyanColor];
    textView.text = @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
    [self.view addSubview: textView];
    
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
    
//    NSLog(@"%@", [NSRunLoop currentRunLoop]);
    
    // 事件是通过source1捕捉分发给sourcr0，由source0来处理的
    
    
    
    // 添加观察者Observer的方式来监听RunLoop的状态以及模式变化
    
    // 创建Observer
    // kCFRunLoopAllActivities：监听所有状态变化
    
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, observeRunLoopActicities, NULL);
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry: { // 一旦有局部变量，花括号确定局部变量的作用域
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopEntry - %@", mode);
                CFRelease(mode); // copy来的要release
                break;
            }
                
            case kCFRunLoopExit: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopExit - %@", mode);
                CFRelease(mode);
                break;
            }
            default:
                break;
        }
    });
    
    // 添加Observer到RunLoop中
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    // 释放（C语言中create创建后要对应释放观察者）
    CFRelease(observer);
    
}

/*
    kCFRunLoopBeforeTimers
    kCFRunLoopBeforeSources
    kCFRunLoopBeforeWaiting 休眠
    kCFRunLoopAfterWaiting  唤醒
    定时器------------
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [NSTimer scheduledTimerWithTimeInterval: 3.0 repeats: YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"定时器------------");
    }];
}


@end
