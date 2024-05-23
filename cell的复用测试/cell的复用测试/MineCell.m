//
//  MineCell.m
//  cell的复用测试
//
//  Created by 张旭洋 on 2023/9/15.
//

#import "MineCell.h"

@implementation MineCell

int createCnt = 0;
int reuseCnt = 0;
- (void)prepareForReuse{
    NSLog(@"复用了 %d 次",++reuseCnt);
    [super prepareForReuse];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    NSLog(@"创建了 %d 次",++createCnt);
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
