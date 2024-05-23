//
//  ColorGameView.m
//  ColorBlockGame
//
//  Created by 张旭洋 on 2024/2/3.
//

#import "ColorGameView.h"
#import "Masonry/Masonry.h"

@implementation ColorGameView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    
    //色块
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 7;
    flowLayout.minimumInteritemSpacing = 7;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width / 1.07, [UIScreen mainScreen].bounds.size.width) collectionViewLayout: flowLayout];
    self.collectionView.center = self.center;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview: self.collectionView];
    [self.collectionView registerClass: [UICollectionViewCell class] forCellWithReuseIdentifier: @"cell"];
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.mas_equalTo(self);
//            make.width.and.height.mas_equalTo([UIScreen mainScreen].bounds.size.width);
//    }];
    
//    self.healthLabel = [[UILabel alloc] initWithFrame: CGRectMake(100, 700, [UIScreen mainScreen].bounds.size.width / 2, 50)];
//    self.healthLabel.textColor = [UIColor whiteColor];
//    [self addSubview: self.healthLabel];
    self.healthView = [[UIImageView alloc] init];
    [self updateHealthView: 3];
    [self addSubview: self.healthView];
    [self.healthView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(137);
            make.height.mas_equalTo(137);
        make.left.mas_equalTo(self.collectionView.mas_left);
            make.top.mas_equalTo(self).mas_offset(67);
    }];
    
    self.progressView = [[UIProgressView alloc] init/*WithFrame: CGRectMake(100, 800, [UIScreen mainScreen].bounds.size.width / 1.5, 100)*/];
    self.progressView.progressViewStyle = UIProgressViewStyleDefault;
//    [self.progressView setProgress: 1.0 animated: YES];
    self.progressView.progress = 1.0;
    self.progressView.tintColor = [UIColor colorWithRed: 147 / 255.0 green: 151 / 255.0 blue: 205 / 255.0 alpha: 1.0];
    self.progressView.trackTintColor = [UIColor lightGrayColor];
    [self addSubview: self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width / 1.07);
            make.height.mas_equalTo(7);
//            make.top.mas_equalTo(self.healthView.mas_bottom);
        make.bottom.mas_equalTo(self.collectionView.mas_top).mas_offset(-17);
        make.centerX.mas_equalTo(self);
    }];
    
    self.scoreLabel = [[UILabel alloc] init/*WithFrame: CGRectMake(100, 600, [UIScreen mainScreen].bounds.size.width / 2, 50)*/];
    self.scoreLabel.textColor = [UIColor colorWithRed: 147 / 255.0 green: 151 / 255.0 blue: 205 / 255.0 alpha: 1.0];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    self.scoreLabel.font = [UIFont boldSystemFontOfSize: 25];
    [self addSubview: self.scoreLabel];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width / 2);
            make.height.mas_equalTo(50);
            make.centerX.mas_equalTo(self);
            make.bottom.mas_equalTo(self.progressView.mas_top);
    }];
    
    self.topScoreLabel = [[UILabel alloc] init];
    self.topScoreLabel.textColor = [UIColor colorWithRed: 147 / 255.0 green: 151 / 255.0 blue: 205 / 255.0 alpha: 1.0];
    self.topScoreLabel.text = @"r4ytwregthr";
    self.topScoreLabel.font = [UIFont boldSystemFontOfSize: 20];
    [self addSubview: self.topScoreLabel];
    [self.topScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.collectionView);
            make.top.mas_equalTo(self.healthView);
            make.centerY.mas_equalTo(self.healthView);
    }];
}

- (void)updateHealthView: (NSInteger)health {
    self.healthView.image = [self healthImage: health];
}

- (UIImage *)healthImage: (NSInteger)health {
    NSString* healthImageName;
    switch (health) {
        case 0:
            healthImageName = @"";
            break;
        case 1:
            healthImageName = @"health1.png";
            break;
        case 2:
            healthImageName = @"health2.png";
            break;
        case 3:
            healthImageName = @"health3.png";
            break;
        default:
            break;
    }
    
    return [UIImage imageNamed: healthImageName];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
