//
//  Manager.h
//  InternetJSONbySingle
//
//  Created by 张旭洋 on 2023/10/22.
//

#import <Foundation/Foundation.h>
#import "TestModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessBlock)(TestModel* testModel);
typedef void(^ErrorBlock)(NSError* error);

@interface Manager : NSObject

+ (instancetype)sharedManager;

- (void)sendRequestWithURL: (NSString *)urlString success: (SuccessBlock)success failure: (ErrorBlock)failure;


@end

NS_ASSUME_NONNULL_END
