//
//  ViewController.h
//  折叠cell
//
//  Created by 张旭洋 on 2023/8/31.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView* foldTableView;
@property (nonatomic, strong)UIButton* foldButton;
@property (nonatomic, strong)NSMutableArray* cellArray;

@end

