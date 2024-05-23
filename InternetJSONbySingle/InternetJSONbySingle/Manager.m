//
//  Manager.m
//  InternetJSONbySingle
//
//  Created by 张旭洋 on 2023/10/22.
//

#import "Manager.h"
#import "AFNetworking.h"

static Manager* manager = nil;

@implementation Manager

+ (instancetype)sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[Manager alloc] init];
        });
    }
    
    return manager;
}

- (void)sendRequestWithURL:(NSString *)urlString success:(SuccessBlock)success failure:(ErrorBlock)failure {
    
    [[AFHTTPSessionManager manager] GET: urlString parameters: nil headers: nil progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            TestModel* testModel = [[TestModel alloc] initWithDictionary: responseObject error: nil];
            success(testModel);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
