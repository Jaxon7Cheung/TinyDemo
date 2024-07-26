//
//  ViewController.m
//  OSSpinLock
//
//  Created by 张旭洋 on 2024/7/26.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>

@interface ViewController ()

@property (nonatomic, assign)NSInteger money;
@property (nonatomic, assign)NSInteger ticketsCount;

// OSSpinLock叫做“自旋锁”，等待锁的线程会处于忙等待状态，一只占用着CPU资源

/*
 为什么要同一把锁？
 如果每条线程下都创建一个新锁，那么这个锁开始永远都是未加锁状态
 故下一个线程不会等待上一个线程结束（线程不会阻塞），而是直接进行
 锁不一样，意味着不同线程可以同时进行
 */
@property (nonatomic, assign)OSSpinLock spinLock;
@property (nonatomic, assign)OSSpinLock spinLock1;
//@property (nonatomic, assign)OSSpinLock spinLock2;

@end

@implementation ViewController

/*
 存取钱问题
 */

- (void)saveMoney {
    
    OSSpinLockLock(&_spinLock1);
    
    NSInteger oldMoney = self.money;
    sleep(.5);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存50元还剩%ld元 --- %@", oldMoney, [NSThread currentThread]);
    
    OSSpinLockUnlock(&_spinLock1);
}

- (void)drawMoney {
    
//    OSSpinLockLock(&_spinLock2);
    OSSpinLockLock(&_spinLock1);
    
    NSInteger oldMoney = self.money;
    sleep(.5);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20元还剩%ld元 --- %@", oldMoney, [NSThread currentThread]);
    
//    OSSpinLockUnlock(&_spinLock2);
    OSSpinLockUnlock(&_spinLock1);
    
}

- (void)moneyTest {
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; ++i) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; ++i) {
            [self drawMoney];
        }
    });
}

/*
 卖票问题
 */

// sleep()让多个线程尽可能拿到相同的值
// 卖1张票
- (void)saleTicket {
    
    // 每次进来的锁都是重新初始化过的，达不到加锁的目的
//    OSSpinLock spinLock = OS_SPINLOCK_INIT;  // 初始化锁
    
    // 加锁
    OSSpinLockLock(&_spinLock);
    
    // 忙等待原理：反复检查锁的状态
    while (/*锁还没被放开*/0) {/*...*/} ;
    
    NSInteger oldTicketCount = self.ticketsCount;
    sleep(.7);
    oldTicketCount--;
    self.ticketsCount = oldTicketCount;
    
    NSLog(@"还剩%ld张票 --- %@", oldTicketCount, [NSThread currentThread]);
    
    // 解锁
    OSSpinLockUnlock(&_spinLock);
}

// 每条线程卖5张票
- (void)saleTickets {
    self.ticketsCount = 15;
    
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
    
    // 初始化锁
    self.spinLock = OS_SPINLOCK_INIT;
    self.spinLock1 = OS_SPINLOCK_INIT;
//    self.spinLock2 = OS_SPINLOCK_INIT;
    
    // 多个线程同一函数
//    [self saleTickets];
    // 才需要加同一把锁
    
    // 多个线程不同函数
    [self moneyTest];
}

/* OSSpinLock会导致优先级反转，不安全了
 
 thread1：High
 
 thread2：Low
 
 thread3：
 
 线程的调度，10ms，多线程原理：时间片轮转调度算法（线程、进程）
 线程优先级：高，分配时间的机会就比较多（多执行一会儿或先执行完）
 
 
 如果等待锁的线程优先级高，它会一直占用者CPU资源（忙等待），优先级低的线程无法进行下去，也就无法释放锁
 */

// 为了增强代码健壮性，也可使用一下函数判断加锁
- (void)saleTicketTry {
    
    // 加锁
    OSSpinLockLock(&_spinLock);
    
    // 返回1，表示线程没有被加锁导致阻塞，加锁成功
    BOOL flag = OSSpinLockTry(&_spinLock);
    if (flag) {
        NSInteger oldTicketCount = self.ticketsCount;
        sleep(.7);
        oldTicketCount--;
        self.ticketsCount = oldTicketCount;
        NSLog(@"还剩%ld张票 --- %@", oldTicketCount, [NSThread currentThread]);
        
        // 解锁
        OSSpinLockUnlock(&_spinLock);
    }
}


@end
