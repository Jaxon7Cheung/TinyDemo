//
//  ViewController.m
//  kkkkk
//
//  Created by 张旭洋 on 2024/4/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
//    UIView* view = [UIView initAviewWithFrame: CGRectMake(77, 77, 177, 177)];
//    [self.view addSubview: view];
//
//    [[NSNotificationCenter defaultCenter] addObserver: @"viewView" selector: @selector(switchColor) name: nil object: nil];
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    [self.view addSubview:mainScrollView];



    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];

    NSArray *fontNames;

    NSInteger indexFamily, indexFont;

    int index = 0;

    for (indexFamily = 0; indexFamily < [familyNames count]; ++indexFamily)

    {

        NSLog(@"Family name: %@", [familyNames objectAtIndex:indexFamily]);

        fontNames = [[NSArray alloc] initWithArray:

                         [UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indexFamily]]];

        for (indexFont = 0; indexFont < [fontNames count]; ++indexFont)

        {

            index ++;

            NSLog(@"    Font name: %@", [fontNames objectAtIndex:indexFont]);

            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30 * index, self.view.frame.size.width, 20)];

            label.text = [NSString stringWithFormat:@"%d  字体  %@", index, [fontNames objectAtIndex:indexFont]];

            label.font = [UIFont fontWithName:[fontNames objectAtIndex:indexFont] size:16];

            [mainScrollView addSubview:label];

        }

    }

    mainScrollView.contentSize = CGSizeMake(0, 30 * (index + 1));

    [self.view addSubview:mainScrollView];
}



@end
