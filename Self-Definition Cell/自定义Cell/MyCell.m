//
//  MyCell.m
//  自定义Cell
//
//  Created by 张旭洋 on 2023/10/16.
//

#import "MyCell.h"

@implementation MyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    
    if (self && [self.reuseIdentifier isEqualToString: @"myCell"]) {
        self.majorLabel = [[UILabel alloc] init];
        self.majorLabel.text = @"自定义Title";
        self.majorLabel.textAlignment = NSTextAlignmentCenter;
        
        self.switchButton = [[UISwitch alloc] init];
        self.switchButton.onTintColor = [UIColor blueColor];
    }
    
    [self.contentView addSubview: self.majorLabel];
    [self.contentView addSubview: self.switchButton];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.majorLabel.frame = CGRectMake(0, 0, 222, self.contentView.bounds.size.height);
    self.majorLabel.center = self.contentView.center;
    
    self.switchButton.frame = CGRectMake(0, 0, 99, 66);
    self.switchButton.center = CGPointMake(66, self.contentView.center.y);
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
