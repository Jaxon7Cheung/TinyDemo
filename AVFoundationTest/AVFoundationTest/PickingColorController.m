//
//  PickingColorController.m
//  AVFoundationTest
//
//  Created by 张旭洋 on 2024/3/23.
//

#import "PickingColorController.h"
#import "PickingColorView.h"
#import "PickingColorModel.h"

@interface PickingColorController () <ToggleButtonDelegate>

@end

@implementation PickingColorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pickingColorModel = [[PickingColorModel alloc] initWithDelegate: self];
    self.pickingColorView = [[PickingColorView alloc] initWithFrame: self.view.bounds andCaptureSession: self.pickingColorModel.captureSession];
    self.pickingColorView.delegate = self;
    
    [self.pickingColorModel startCaptureSession];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)toggleCameraPosition {
    NSLog(@"qwer");
    [self.pickingColorModel toggleCameraPosition];
}
@end
