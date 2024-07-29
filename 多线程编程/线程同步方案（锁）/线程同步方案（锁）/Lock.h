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

// 供子类去使用
- (void)saveMoney;
- (void)drawMoney;
- (void)saleTicket;
- (void)otherTest;

@end

NS_ASSUME_NONNULL_END
