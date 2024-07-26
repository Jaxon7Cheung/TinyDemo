//
//  ViewController.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/25.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign)NSInteger money;
@property (nonatomic, assign)NSInteger ticketsCount;

@end

@implementation ViewController

/*
 存取钱问题
 */

- (void)saveMoney {
    NSInteger oldMoney = self.money;
    sleep(3.5);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存50元还剩%ld元 --- %@", oldMoney, [NSThread currentThread]);
}

- (void)drawMoney {
    NSInteger oldMoney = self.money;
    sleep(3.5);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20元还剩%ld元 --- %@", oldMoney, [NSThread currentThread]);
}

- (void)moneyTest {
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; ++i) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; ++i) {
            [self drawMoney];
        }
    });
}

/*
 卖票问题
 */

// 让多个线程尽可能拿到相同的值
- (void)saleTicket {
    NSInteger oldTicketCount = self.ticketsCount;
    sleep(.7);
    oldTicketCount--;
    self.ticketsCount = oldTicketCount;
    
    NSLog(@"还剩%ld张票 --- %@", oldTicketCount, [NSThread currentThread]);
}

// 每条线程卖5张票
- (void)saleTickets {
    self.ticketsCount = 17;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; ++i) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; ++i) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; ++i) {
            [self saleTicket];
        }
    });
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 多条线程调用同一方法
//    [self saleTickets];
    
    // 多条线程调用不同方法
//    [self moneyTest];
    
    
    
    
}


@end
