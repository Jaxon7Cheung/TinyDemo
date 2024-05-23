//
//  ViewController.m
//  newPodTest
//
//  Created by Eleven on 2023/8/29.
//

#import "ViewController.h"
//加入这个宏，可以省略所有mas_（除了mas_equalTo）
#define MAS_SHORTHAND
//加入这个宏，那么mas_equalTo就和equalTo一样了
#define MAS_SHORTHAND_GLOBALS
//上面的两个宏一定要在这句之前

//引用Masonry文件
#import "Masonry.h"
//#import "Masonry/Masonry.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIView* tipView = [[UIView alloc] init];
//    tipView.backgroundColor = [UIColor systemMintColor];
//    //tipView.frame = CGRectMake(0, 66, SCREEN_WIDTH, 35);
//    //先添加，再设置约束，否则报错
//    [self.view addSubview: tipView];
//
//    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
////        //1.设置tipView的中心点x等于self.view的中心点的x
////        make.centerX.equalTo(self.view);
////        //设置tipView等顶部等于self.view的顶部，同时偏移30
////        make.top.equalTo(self.view).offset(66);
////        //设置宽和高
////        make.size.mas_equalTo(CGSizeMake(300, 200));
//
////        //2.设置tipView的中心点等于self.view的中心点
////        make.center.equalTo(self.view);
////        //等同于下面
////        //make.centerX.mas_equalTo(self.view.mas_centerX);
////        //make.centerY.mas_equalTo(self.view.mas_centerY);
////        //设置宽和高
////        make.size.mas_equalTo(CGSizeMake(300, 100));
//
////        //3.注意mas_equalTo后面对应的是数值，equalTo后面跟的是一个对象
//
////        //4.设置tipView的宽和高
////        make.size.mas_equalTo(CGSizeMake(300, 200));
////        make.width.mas_equalTo(300);
////        make.height.mas_equalTo(100);
////        //右边距20，x轴向左是正数，向右是负数
////        make.right.equalTo(self.view).offset(-20);
////        make.bottom.equalTo(self.view).offset(-20);
//
////        //5.tipView的宽和高等于父控件的一半
////        make.size.equalTo(self.view).multipliedBy(0.5);
////        make.right.mas_equalTo(self.view.mas_right).offset(-20);
////        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-20);
//
////        //6.距离各个边距50
////        make.left.mas_equalTo(self.view.mas_left).offset(50);
////        make.top.mas_equalTo(self.view.mas_top).offset(50);
////        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
////        make.right.mas_equalTo(self.view.mas_right).offset(-50);
////        //区别在于第一个约束会参考到self.view的右边界，而第二个约束只是一个简单的数值对齐，没有涉及到其他控件。
////        /*
////         make.left.mas_equalTo(self.view.mas_left).offset(50);
////         make.top.mas_equalTo(self.view.mas_top).offset(50);
////         make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
////         make.right.mas_equalTo(self.view.mas_right).offset(-50);
////         */
//
//         make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
//    }];
//
//
//    //警告内容
//    UILabel* labelTip = [[UILabel alloc] init];
//    labelTip.backgroundColor = [UIColor magentaColor];
//    labelTip.textColor = [UIColor blackColor];
//    labelTip.textAlignment = NSTextAlignmentCenter;
//    labelTip.font = [UIFont systemFontOfSize: 15];
//    //指定文本是否自动调整字体大小以适应标签的宽度。当这个属性设置为true时，如果文本内容比标签的宽度要宽，则会自动缩小字体大小使其适应标签的宽度。默认为false。
//    labelTip.adjustsFontSizeToFitWidth = YES;
//    labelTip.text = @"只能选择使用群策的用户进行聊天";
//    //labelTip.frame = CGRectMake(0, 0, SCREEN_WIDTH, 35);
//    labelTip.frame = CGRectMake(0, 0, 150, 35);
//    [tipView addSubview: labelTip];
//
//    [labelTip mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(tipView);
//        //也可通过不设置此宽度数值来进行字体标签自适应
//            make.width.mas_equalTo(200);
//            make.height.mas_equalTo(18);
//    }];
//
//    //警告图标
//    UIImageView* imageTip = [[UIImageView alloc] init];
//    [imageTip setImage: [UIImage imageNamed: @"野原新之助.png"]];
//    [tipView addSubview: imageTip];
//
//    [imageTip mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(45);
//            make.height.mas_equalTo(30);
//            make.right.mas_equalTo(labelTip.mas_left).offset(-1);
//            make.centerY.equalTo(tipView.mas_centerY);
//    }];
    self.buttons = [NSMutableArray array];
    [self createButtons];
    
}

- (void)createButtons {
    for (int i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setBackgroundImage: [UIImage imageNamed: [NSString stringWithFormat: @"%d.png", i % 7 + 1]] forState: UIControlStateNormal];
        [button addTarget: self action: @selector(buttonTapped:) forControlEvents: UIControlEventTouchUpInside];
        [self.view addSubview: button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i % 3 == 0) { // 代表第一列
                make.left.equalTo(self.view.mas_left).offset(10);
            } else {
                make.left.equalTo(self.buttons[i - 1].mas_right).offset(10);
            }
            
            if (i / 3 == 0) { // 代表第一行
                make.top.equalTo(self.view.mas_top).offset(10);
            } else {
                make.top.equalTo(self.buttons[i - 3].mas_bottom).offset(10);
            }
            
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        
        [self.buttons addObject: button];
    }
}


- (void)buttonTapped:(UIButton *)sender {
    [self.buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        if (button == sender) {
            [self.view bringSubviewToFront: button];
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.size.mas_equalTo(CGSizeMake(200, 200));
            }];
        } else {
            [self.view sendSubviewToBack: button];
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                if (idx % 3 == 0) { // 第一列
                    make.left.equalTo(self.view.mas_left).offset(10);
                } else {
                    make.left.equalTo(self.buttons[idx - 1].mas_right).offset(10);
                }
                
                if (idx / 3 == 0) { // 第一行
                    make.top.equalTo(self.view.mas_top).offset(10);
                } else {
                    make.top.equalTo(self.buttons[idx - 3].mas_bottom).offset(10);
                }
                
                make.size.mas_equalTo(CGSizeMake(100, 100));
            }];
        }
    }];
    
    [UIView animateWithDuration: 0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        [self.view sendSubviewToBack: button];
        [button mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (idx % 3 == 0) { // 第一列
                make.left.equalTo(self.view.mas_left).offset(10);
            } else {
                make.left.equalTo(self.buttons[idx - 1].mas_right).offset(10);
            }
            
            if (idx / 3 == 0) { // 第一行
                make.top.equalTo(self.view.mas_top).offset(10);
            } else {
                make.top.equalTo(self.buttons[idx - 3].mas_bottom).offset(10);
            }
            
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    }];
    
    [UIView animateWithDuration: 0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
