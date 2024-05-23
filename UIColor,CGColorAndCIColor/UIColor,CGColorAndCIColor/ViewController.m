//
//  ViewController.m
//  UIColor,CGColorAndCIColor
//
//  Created by 张旭洋 on 2024/1/13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
//    CGColorRef cgColor = [UIColor orangeColor].CGColor;
//    CGColorSpaceRef colorSpace = CGColorGetColorSpace(cgColor);
//    NSLog(@"color space:%@", colorSpace);
//
//    //获得颜色组成部分的个数
//    NSUInteger numOfComponents = CGColorGetNumberOfComponents(cgColor);
//
//    //获取世纪颜色的组成部分的数组
//    const CGFloat* colorComponents = CGColorGetComponents(cgColor);
//
//    for (int i = 0; i < numOfComponents; i++) {
//        NSLog(@"color components %d : %f", i, colorComponents[i]);
//    }
    
//    UIColor* color = [UIColor colorWithCGColor: [UIColor whiteColor].CGColor];
//    NSLog(@"CGColor from UIColor: %@", color.CGColor);
////    NSLog(@"CIColor from UIColor: %@", color.CIColor);

//    //这里颜色空间使用CMYK
//    CGColorSpaceRef cmykSpace = CGColorSpaceCreateDeviceCMYK();
//
//    CGFloat cmykComponents[] = {1, 1, 0, 0, 1};  //蓝色
//    CGColorRef colorCMYK = CGColorCreate(cmykSpace, cmykComponents);
//    CGColorSpaceRelease(cmykSpace);
//    NSLog(@"colorCMYK:%@", colorCMYK);
//
//    //使用CGColor初始化UIColor
//    UIColor* color = [UIColor colorWithCGColor: colorCMYK];
//    NSLog(@"CGColor from UIColor:%@", color.CGColor);
    
//    //白色的颜色空间就是Gray
////    NSLog(@"CGColor white color:%@", [UIColor whiteColor].CGColor);
//    //红色的颜色空间时RGB
//    NSLog(@"CGColor red color:%@", [UIColor redColor].CGColor);
//    putchar('\n');
//
//    //设置CIColor
//    CIColor* ciColor = [CIColor colorWithCGColor: [UIColor redColor].CGColor];
//    NSLog(@"ciColor:%@", ciColor);
//    NSLog(@"ciColor colorSpace:%@", ciColor.colorSpace);putchar('\n');
//
//    //初始化
//    UIColor* color = [UIColor colorWithCIColor: ciColor];
//    NSLog(@"color:%@", color);
//    NSLog(@"ciColor from UIColor:%@", color.CIColor);
//    NSLog(@"ciColor's colorSpace:%@", color.CIColor.colorSpace);
//    NSLog(@"color's CGColor:%@", color.CGColor);
    
//    CGColorSpaceRef cmykSpace = CGColorSpaceCreateDeviceCMYK();
//    NSLog(@"Components number: %lu", CGColorSpaceGetNumberOfComponents(cmykSpace));putchar('\n');
//
//    CGFloat cmykComponents[] = {1, 1, 0, 0, 1};  //蓝色
//    CGColorRef colorCMYK = CGColorCreate(cmykSpace, cmykComponents);
//    CGColorSpaceRelease(cmykSpace);
//    NSLog(@"colorCMYK:%@", colorCMYK);putchar('\n');
//
//    CIColor* ciColor = [CIColor colorWithCGColor: colorCMYK];
//    NSLog(@"ciColor: %@", ciColor);
//    NSLog(@"ciColor colorSpace: %@", ciColor.colorSpace);putchar('\n');
//
//    UIColor* color = [UIColor colorWithCIColor: ciColor];
//    NSLog(@"color: %@", color);
//    NSLog(@"ciColor from UIColor: %@", color.CIColor);
//    NSLog(@"ciColor's colorSpace: %@", color.CIColor.colorSpace);
//    NSLog(@"cgColor from UIColor: %@", color.CGColor);
    
    if (CGColorEqualToColor([UIColor whiteColor].CGColor, [UIColor colorWithRed: 1.0 green: 1.0 blue: 1.0 alpha: 1.0].CGColor)) {
        NSLog(@"两颜色相等");
    } else {
        NSLog(@"两颜色不相等");
    }
    if (CGColorEqualToColor([UIColor colorWithRed: 1.0 green: 1.0 blue: 1.0 alpha: 1.0].CGColor, [UIColor colorWithRed: 1.0 green: 1.0 blue: 1.0 alpha: 1.0].CGColor)) {
        NSLog(@"两颜色相等");
    } else {
        NSLog(@"两颜色不相等");
    }
    
    
}


@end
