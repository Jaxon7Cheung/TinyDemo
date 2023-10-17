//
//  ViewController.m
//  自定义Cell
//
//  Created by 张旭洋 on 2023/10/16.
//

#import "ViewController.h"
#import "MyCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds];
    self.tableView.dataSource = self;
    
    [self.view addSubview: self.tableView];
    
    [self.tableView registerClass: [MyCell class] forCellReuseIdentifier: @"myCell"];
    [self.tableView registerClass: [MyCell class] forCellReuseIdentifier: @"myCell2"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell* mycell = [self.tableView dequeueReusableCellWithIdentifier: @"myCell"];
    mycell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 2) mycell.majorLabel.text = @"Hhh";
    
    return mycell;
}

@end
