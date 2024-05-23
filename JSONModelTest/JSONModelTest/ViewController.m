//
//  ViewController.m
//  JSONModelTest
//
//  Created by 张旭洋 on 2023/10/22.
//

#import "ViewController.h"
#import "TestModel.h"

#import "TestObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString* jsonData = @"https://news-at.zhihu.com/api/4/news/latest";
    jsonData = [jsonData stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString: jsonData];
    NSURLRequest* request = [NSURLRequest requestWithURL: url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionTask* task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        TestModel* testModel = [[TestModel alloc] initWithData: data error: nil];
        NSLog(@"%@", testModel.stories[0]);
        
//        NSLog(@"%@", testModel.stories[0].title);
//        NSLog(@"%@", testModel.stories[0][@"title"]);
        StoriesModel* stories = testModel.stories[0];
        NSLog(@"%@", stories.title);
        
        
    }];
    
    [task resume];
}

- (void)requestLatestStories {
    NSString* jsonData = @"https://news-at.zhihu.com/api/4/news/latest";
    jsonData = [jsonData stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL* url = [NSURL URLWithString: jsonData];
    NSURLRequest* request = [NSURLRequest requestWithURL: url];
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionTask* task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        TestModel* testModel = [[TestModel alloc] initWithData: data error: nil];
        
//        NSLog(@"%@", testModel.stories[0].title);
        NSLog(@"%@", testModel.stories[0][@"title"]);
        StoriesModel* stories = testModel.stories[0];
        NSLog(@"%@", stories.title);
        
        NSLog(@"%@", testModel.stories[0]);
    }];
    
    [task resume];
}

@end
