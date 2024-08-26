//
//  PermenantThread.h
//  RunLoop线程保活封装类
//
//  Created by 张旭洋 on 2024/8/26.
//

#import <Foundation/Foundation.h>

typedef void(^PermenantThreadTask)(void);

NS_ASSUME_NONNULL_BEGIN

@interface PermenantThread : NSObject

// 开启线程
- (void)run;

// 在当前线程执行一个任务
- (void)executeTask:(PermenantThreadTask)task;

// 结束线程
- (void)stop;

@end

NS_ASSUME_NONNULL_END
