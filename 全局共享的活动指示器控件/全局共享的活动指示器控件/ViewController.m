//
//  ViewController.m
//  全局共享的活动指示器控件
//
//  Created by 张旭洋 on 2024/1/29.
//

#import "ViewController.h"
#import "MyActivityIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: 33 / 255.0 green: 33 / 255.0 blue: 33 / 255.0 alpha: 1.0];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [MyActivityIndicatorView setText: @"精彩内容，马上呈现～"];
    [MyActivityIndicatorView startActivity];
}




@end
