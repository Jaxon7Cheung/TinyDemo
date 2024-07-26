//
//  ViewController.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/25.
//

#import "ViewController.h"
#import "Lock.h"
#import "OSSpinLockClass.h"
#import "OSUnfairLockClass.h"
#import "PthreadMutexClass.h"
#import "PthreadMutexClass1.h"

@interface ViewController ()

@property (nonatomic, strong)Lock* lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 多条线程调用同一方法
//    [self saleTickets];
    
    // 多条线程调用不同方法
//    [self moneyTest];
    
//    self.lock = [[Lock alloc] init];
//    self.lock = [[OSSpinLockClass alloc] init];
//    self.lock = [[OSUnfairLockClass alloc] init];
//    self.lock = [[PthreadMutexClass alloc] init];
    self.lock = [[PthreadMutexClass1 alloc] init];
    
//    [self.lock saleTickets];
//    [self.lock moneyTest];
    [self.lock otherTest];
    
    
    
    
}


@end
