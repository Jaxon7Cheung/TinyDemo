//
//  SerialQueueClass.m
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/29.
//

#import "SerialQueueClass.h"

@interface SerialQueueClass ()

@property (nonatomic, strong)dispatch_queue_t ticketQueue;
@property (nonatomic, strong)dispatch_queue_t moneyQueue;

@end

@implementation SerialQueueClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)drawMoney {
    
    
    dispatch_sync(self.moneyQueue, ^{
        [super drawMoney];
    });
    
    
}

- (void)saveMoney {
    
    dispatch_sync(self.moneyQueue, ^{
        [super saveMoney];
    });
    
}

- (void)saleTicket {
    
    dispatch_sync(self.ticketQueue, ^{
        [super saleTicket];
    });
    
}


@end
