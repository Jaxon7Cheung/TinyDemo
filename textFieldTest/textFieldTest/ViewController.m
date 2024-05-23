//
//  ViewController.m
//  textFieldTest
//
//  Created by 张旭洋 on 2024/1/29.
//

#import "ViewController.h"
#import "UIUntitledTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIUntitledTextField* untitledTextField = [[UIUntitledTextField alloc] initWithFrame: CGRectMake(self.view.frame.size.width / 2 - 20, self.view.frame.size.height / 2 - 20, 666, 30)];
    untitledTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: untitledTextField];
}


@end
