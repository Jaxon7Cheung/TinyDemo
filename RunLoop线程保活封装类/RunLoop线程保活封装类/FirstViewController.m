//
//  FirstViewController.m
//  RunLoop线程保活封装类
//
//  Created by 张旭洋 on 2024/8/26.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong)UIButton* button;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(77, 77, 377, 277);
    
    [self.button setTitle: @"跳转" forState: UIControlStateNormal];
    [self.button addTarget: self action: @selector(pushView) forControlEvents: UIControlEventTouchUpInside];
    
    [self.view addSubview: self.button];
    
    
}

- (void)pushView {
    ViewController* viewController = [[ViewController alloc] init];
    [self.navigationController pushViewController: viewController animated: YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
