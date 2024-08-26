//
//  ViewController.m
//  RunLoop线程保活封装类
//
//  Created by 张旭洋 on 2024/8/26.
//

#import "ViewController.h"
#import "PermenantThread.h"

// 利用RunLoop封装生命周期可控的线程类

@interface ViewController ()

@property (nonatomic, strong)UIButton* button;
@property (nonatomic, strong)PermenantThread* thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.thread = [[PermenantThread alloc] init];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(77, 77, 377, 277);
    
    [self.button setTitle: @"停止" forState: UIControlStateNormal];
    [self.button addTarget: self action: @selector(stopAction) forControlEvents: UIControlEventTouchUpInside];
    
    [self.view addSubview: self.button];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread executeTask:^{
            NSLog(@"执行任务 - %@", [NSThread currentThread]);
    }];
}

- (void)stopAction {
    [self.thread stop];
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}


@end
