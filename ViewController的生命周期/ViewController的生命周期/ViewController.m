//
//  ViewController.m
//  ViewController的生命周期
//
//  Created by 张旭洋 on 2023/9/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.freshView = [[UIView alloc] init];
    self.freshView.backgroundColor = [UIColor magentaColor];
    self.freshView.frame = CGRectMake(0, 0, 266, 277);
    self.freshView.center = self.view.center;
    [self.view addSubview: self.freshView];
    
    UITapGestureRecognizer* gestureTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(hideViewController)];
    [self.freshView addGestureRecognizer: gestureTapRecognizer];
}

//默认视图及其包含的子视图即将在屏幕中出现
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}    // Called when the view is about to made visible. Default does nothing

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
}     // Called when the view has been fully transitioned onto the screen. Default does nothing

//Controller从屏幕中消失不见时（对应一些销毁的逻辑）
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
}  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing

- (void) dealloc {
    
}

- (void)hideViewController {
    UIViewController* viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor systemMintColor];
    
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController: viewController animated: YES completion: nil];
    
}

@end
