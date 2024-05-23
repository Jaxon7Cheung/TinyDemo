//
//  ViewController.m
//  POST测试
//
//  Created by 张旭洋 on 2024/1/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self loginByPasswordURL];
//    [self loginURL];
    [self loginURL];
}

- (void)loginURL {
    NSURL* url = [NSURL URLWithString: @"http://47.94.236.227:8081/user/loginByPassword"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"phone=18291734442&password=122333Az%26" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionTask* task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary* dict = [NSJSONSerialization JSONObjectWithData: data options: kNilOptions error: &error];
            
            NSLog(@"%@", dict);
        } else {
            NSLog(@"error:%@", error);
        }
    }];
    
    [task resume];
}

//- (void)loginByPasswordURL {
//
//dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//
//NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://47.94.236.227:8081/user/loginByPassword?phone=18291734445"]
//   cachePolicy:NSURLRequestUseProtocolCachePolicy
//   timeoutInterval:10.0];
//NSDictionary *headers = @{
//   @"User-Agent": @"Apifox/1.0.0 (https://apifox.com)",
//   @"Accept": @"*/*",
//   @"Host": @"47.94.236.227:8081",
//   @"Connection": @"keep-alive",
//   @"Content-Type": @"multipart/form-data; boundary=--------------------------807953470762187701047023"
//};
//
//[request setAllHTTPHeaderFields:headers];
//NSArray *parameters = @[
//   @{ @"name": @"phone", @"value": @"18291734445" },
//   @{ @"name": @"password", @"value": @"12346Az*" }
//];
//
//NSString *boundary = @"----WebKitFormBoundary7MA4YWxkTrZu0gW";
//NSError *error;
//NSMutableString *body = [NSMutableString string];
//
//for (NSDictionary *param in parameters) {
//   [body appendFormat:@"--%@\r\n", boundary];
//   [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"\r\n\r\n", param[@"name"]];
//   [body appendFormat:@"%@", param[@"value"]];
//}
//[body appendFormat:@"\r\n--%@--\r\n", boundary];
//    NSLog(@"qqq:%@", body);
//NSData *postData = [body dataUsingEncoding:NSUTF8StringEncoding];
//[request setHTTPBody:postData];
//
//[request setHTTPMethod:@"POST"];
//
//NSURLSession *session = [NSURLSession sharedSession];
//NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
//completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//   if (error) {
//      NSLog(@"%@", error);
//      dispatch_semaphore_signal(sema);
//   } else {
//      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//      NSError *parseError = nil;
//      NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
//      NSLog(@"%@",responseDictionary);
//      dispatch_semaphore_signal(sema);
//   }
//}];
//[dataTask resume];
//dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//}

@end
