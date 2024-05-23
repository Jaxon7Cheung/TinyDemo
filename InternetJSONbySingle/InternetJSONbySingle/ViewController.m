//
//  ViewController.m
//  InternetJSONbySingle
//
//  Created by 张旭洋 on 2023/10/22.
//

#import "ViewController.h"
#import "Manager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [[Manager sharedManager] sendRequestWithURL: @"https://news-at.zhihu.com/api/4/news/latest" success:^(TestModel * _Nonnull testModel) {
            NSLog(@"%@", testModel.stories[0]);
        } failure:^(NSError * _Nonnull error) {
            if (error) NSLog(@"请求失败");
        }];
}

- (void)requestTest {
    [[Manager sharedManager] sendRequestWithURL: @"https://news-at.zhihu.com/api/4/news/latest" success:^(TestModel * _Nonnull testModel) {
            NSLog(@"%@", testModel.stories[0]);
        } failure:^(NSError * _Nonnull error) {
            if (error) NSLog(@"请求失败");
        }];
}


@end
