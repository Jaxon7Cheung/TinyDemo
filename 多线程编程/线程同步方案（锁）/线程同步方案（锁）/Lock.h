//
//  Lock.h
//  线程同步方案（锁）
//
//  Created by 张旭洋 on 2024/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Lock : NSObject



- (void)moneyTest;
- (void)saleTickets;
- (void)otherTest;

// 供子类去使用
- (void)saveMoney;
- (void)drawMoney;
- (void)saleTicket;

@end

NS_ASSUME_NONNULL_END
