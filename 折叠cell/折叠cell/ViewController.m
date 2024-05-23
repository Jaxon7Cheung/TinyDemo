//
//  ViewController.m
//  折叠cell
//
//  Created by 张旭洋 on 2023/8/31.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor systemMintColor];
    
    self.foldTableView = [[UITableView alloc] init];
    self.foldTableView.frame = CGRectMake(SCREEN_WIDTH / 2 - 55, 180, 110, 25);
    self.foldTableView.delegate = self;
    self.foldTableView.dataSource = self;
    [self.view addSubview: self.foldTableView];
    [self.foldTableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"foldcell"];
    
    self.foldButton = [UIButton buttonWithType: UIButtonTypeCustom];
    self.foldButton.frame = CGRectMake(SCREEN_WIDTH / 2 + 35, 168, 48, 48);
    [self.foldButton setImage: [UIImage imageNamed: @"关闭.png"] forState: UIControlStateNormal];
    [self.foldButton addTarget: self action: @selector(pressUnfold) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.foldButton];
    
    self.cellArray = [[NSMutableArray alloc] initWithObjects: @"原创教程", @"设计资料", @"设计教程", @"设计师观点", nil];
    self.foldTableView.layer.cornerRadius = 3.0;
    self.foldTableView.layer.masksToBounds = YES;
}

- (void)pressUnfold {
    if (self.foldButton.selected == NO) {
        self.foldTableView.frame = CGRectMake(SCREEN_WIDTH / 2 - 55, 180, 110, 100);
        [self.foldButton setImage: [UIImage imageNamed: @"打开.png"] forState: UIControlStateNormal];
        self.foldButton.selected = YES;
    } else {
        self.foldTableView.frame = CGRectMake(SCREEN_WIDTH / 2 - 55, 180, 110, 25);
        [self.foldButton setImage: [UIImage imageNamed: @"关闭.png"] forState: UIControlStateNormal];
        self.foldButton.selected = NO;
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: @"foldcell"];
    
    cell.textLabel.text = self.cellArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize: 14];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.foldButton.selected == NO) {
        self.foldTableView.frame = CGRectMake(SCREEN_WIDTH / 2 - 55, 180, 110, 100);
        self.foldButton.selected = YES;
        [self.foldTableView reloadData];
        [self.foldButton setImage: [UIImage imageNamed: @"打开.png"] forState: UIControlStateNormal];
    } else {
        UITableViewCell *cell = [self.foldTableView cellForRowAtIndexPath: indexPath];
        NSString *str = [NSString stringWithFormat: @"%@", cell.textLabel.text];
        
        for (int i = 0; i < 4; i++) {
            if ([self.cellArray[i] isEqualToString: str]) {
                self.cellArray[i] = self.cellArray[0];
                break;
            }
        }
        self.cellArray[0] = str;
        self.foldTableView.frame = CGRectMake(SCREEN_WIDTH / 2 - 55, 180, 110, 25);
        self.foldButton.selected = NO;
        [self.foldTableView reloadData];
        [self.foldButton setImage: [UIImage imageNamed: @"关闭.png"] forState: UIControlStateNormal];
    }
}



@end
