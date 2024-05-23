//
//  MyCell.h
//  自定义Cell
//
//  Created by 张旭洋 on 2023/10/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCell : UITableViewCell

@property (nonatomic, strong)UILabel* majorLabel;
@property (nonatomic, strong)UISwitch* switchButton;

@end

NS_ASSUME_NONNULL_END
