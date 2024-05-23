//
//  Manager.m
//  ColorScheme
//
//  Created by 张旭洋 on 2024/3/23.
//

#import "Manager.h"

@implementation Manager

static id manager = nil;

+ (instancetype)sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[Manager alloc] init];
        });
    }
    return manager;
}

- (void)requestColoringScheme:(NSString *)token success:(ColorModelBlock)success failure:(ErrorBlock)failure {
    
    NSURL *url = [NSURL URLWithString:@"http://zy520.online:8081/attach/Favorite"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSDictionary *headers = @{
       @"Cookie": [NSString stringWithFormat: @"Authorization=%@", token],
       @"User-Agent": @"Apifox/1.0.0 (https://apifox.com)",
       @"Accept": @"*/*",
       @"Host": @"zy520.online:8081",
       @"Connection": @"keep-alive"
    };
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            ColorSchemeModel *colorSchemeModel = [[ColorSchemeModel alloc] initWithData:data error:nil];
            success(colorSchemeModel);
        } else {
            failure(error);
            NSLog(@"error:%@", error);
        }
    }];
    
    [task resume];
}



- (void)requestResultForAddingName:(NSString *)name withToken: (NSString *)token success:(AddNameBlock)success failure:(ErrorBlock)failure {
//    NSLog(@"%@", name);
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"http://zy520.online:8081/attach/createFavorite?name=%@", name]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
//    request.HTTPBody = [[NSString stringWithFormat: @"name=方案B"] dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *headers = @{
       @"Cookie": [NSString stringWithFormat: @"Authorization=%@", token],
       @"User-Agent": @"Apifox/1.0.0 (https://apifox.com)",
       @"Accept": @"*/*",
       @"Host": @"zy520.online:8081",
       @"Connection": @"keep-alive",
       @"Content-Type": @"multipart/form-data; boundary=--------------------------577602883893983905959428"
    };
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            AddNameModel* addNameModel = [[AddNameModel alloc] initWithData:data error:nil];
            NSLog(@"%@", addNameModel);
            NSLog(@"%@", data);
            success(addNameModel);
        } else {
            failure(error);
            NSLog(@"error:%@", error);
        }
    }];
    
    [task resume];
}

- (void)requestResultForDeletingName:(NSString *)name withToken:(NSString *)token success:(DeleteNameBlock)success failure:(ErrorBlock)failure {
    NSLog(@"%@111", name);
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"http://zy520.online:8081/attach/cancelFavorite?name=%@", name]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"DELETE"];
    
    NSDictionary *headers = @{
       @"Cookie": [NSString stringWithFormat: @"Authorization=%@", token],
       @"User-Agent": @"Apifox/1.0.0 (https://apifox.com)",
       @"Accept": @"*/*",
       @"Host": @"zy520.online:8081",
       @"Connection": @"keep-alive",
       @"Content-Type": @"multipart/form-data; boundary=--------------------------111473860920218998637136"
    };
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            DeleteNameModel* deleteNameModel = [[DeleteNameModel alloc] initWithData:data error:nil];
            NSLog(@"deleteNameModel:%@", deleteNameModel);
//            NSLog(@"%@", data);
            success(deleteNameModel);
        } else {
            failure(error);
            NSLog(@"error:%@", error);
        }
    }];
    
    [task resume];
}

@end
