//
//  ColorGameController.m
//  ColorBlockGame
//
//  Created by 张旭洋 on 2024/2/3.
//

#import "ColorGameController.h"
#import "ColorGameView.h"
#import "ColorGameModel.h"
#import "ColorBlockModel.h"

@interface ColorGameController ()

@end

@implementation ColorGameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.colorGameModel = [[ColorGameModel alloc] init];
    self.blocks = [[NSMutableArray alloc] init];
    
    self.colorGameView = [[ColorGameView alloc] initWithFrame: self.view.bounds];
    self.colorGameView.collectionView.delegate = self;
    self.colorGameView.collectionView.dataSource = self;
    [self.view addSubview: self.colorGameView];
    
    [self resetGame];
    [self generateColorBlocks];
    
    [self setTimer];
    
}

#pragma mark 倒计时条

- (void)setTimer {
    self.currentTime = 10.0;
    self.colorGameView.progressView.progress = self.currentTime;
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector: @selector(updateProgress) userInfo: nil repeats: YES];
}

- (void)updateProgress {
    self.currentTime -= 0.01;
    [self.colorGameView.progressView setProgress: self.currentTime / 10.0 animated: YES];
    
//    NSLog(@"%f", self.currentTime);
    if (self.currentTime <= 0.0) {
        NSLog(@"dwad");
        [self resetGame];
        [self generateColorBlocks];
        [self updateUI];
    }
    
}

- (void)resetTimer {
    [self.gameTimer invalidate];
    self.gameTimer = nil;
    [self setTimer];
}


#pragma mark 色块

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    NSLog(@"%ld", [self.blocks count]);
    return [self.blocks count];
//    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell" forIndexPath: indexPath];
    ColorBlockModel* block = self.blocks[indexPath.row];
    cell.backgroundColor = block.color;
//    cell.backgroundColor = [UIColor cyanColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 3.7;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%ld %ld", indexPath.item, indexPath.row);
    ColorBlockModel* selectedBlock = self.blocks[indexPath.item];
    if (selectedBlock.isDifferent) {
        [self resetTimer];
        self.colorGameModel.currentScore++;
        if (self.colorGameModel.currentScore % 5 == 0) {
            self.colorGameModel.level++;
        }
        [self generateColorBlocks];
    } else {
        self.colorGameModel.health--;
        if (!self.colorGameModel.health) {
            [self resetGame];
            [self generateColorBlocks];
        }
    }
    
    [self updateUI];
}

#pragma mark 功能性函数

- (void)resetGame {
    self.colorGameModel.currentScore = 0;
    self.colorGameModel.health = 3;
    self.colorGameModel.level = 3;
    [self resetTimer];
    [self updateUI];
}

- (void)updateUI {
    self.colorGameView.scoreLabel.text = [NSString stringWithFormat: @"%ld", self.colorGameModel.currentScore];
//    self.colorGameView.healthLabel.text = [NSString stringWithFormat: @"血量：%ld", self.colorGameModel.health];
    self.colorGameView.topScoreLabel.text = [NSString stringWithFormat: @"最高记录：%ld", self.colorGameModel.topScore];
    [self.colorGameView updateHealthView: self.colorGameModel.health];
    
    [self updateGridLayout];
    [self.colorGameView.collectionView reloadData];
}

//更新数据源数组
- (void)generateColorBlocks {
    [self.blocks removeAllObjects];
    
    NSInteger numberOfBlocks = self.colorGameModel.level * self.colorGameModel.level;
    NSInteger randomIndex = arc4random_uniform((uint32_t)numberOfBlocks);
    
    NSInteger R = (arc4random() % 256);
    NSInteger G = (arc4random() % 256);
    NSInteger B = (arc4random() % 256);
    UIColor* randomColor = [UIColor colorWithRed: R / 255.0 green: G / 255.0 blue: B / 255.0 alpha: 1.0];
    
    UIColor* differentColor = [self slightlyDifferentFrom: randomColor];
    
    for (NSInteger i = 0; i < numberOfBlocks; ++i) {
        ColorBlockModel* block = [[ColorBlockModel alloc] init];
        if (i == randomIndex) {
            block.color = differentColor;
            block.isDifferent = YES;
        } else {
            block.color = randomColor;
            block.isDifferent = NO;
        }
        
        [self.blocks addObject: block];
    }
    
    
}

- (UIColor *)slightlyDifferentFrom: (UIColor *)color {
    CGFloat hue, saturation, brightness, alpha;
    if ([color getHue: &hue saturation: &saturation brightness: &brightness alpha: &alpha]) {
        CGFloat brightnessDelta = 0.07;
        brightness += (brightness > 0.5) ? -brightnessDelta : brightnessDelta;
        
        return [UIColor colorWithHue: hue saturation: saturation brightness: brightness alpha: alpha];
    }
    
    return color;
}

- (void)updateGridLayout {
    CGFloat totalWidth = self.colorGameView.collectionView.bounds.size.width;
    CGFloat spacing = ((UICollectionViewFlowLayout *)self.colorGameView.collectionView.collectionViewLayout).minimumInteritemSpacing;
    CGFloat sectionInsetLeft = ((UICollectionViewFlowLayout *)self.colorGameView.collectionView.collectionViewLayout).sectionInset.left;
    CGFloat sectionInsetRight = ((UICollectionViewFlowLayout *)self.colorGameView.collectionView.collectionViewLayout).sectionInset.right;
    
    NSInteger itemsPerRow = self.colorGameModel.level; // 根据n的值确定每行的item数量
    
    CGFloat totalSpacing = (itemsPerRow - 1) * spacing; // 总共的间距
    CGFloat totalInset = sectionInsetLeft + sectionInsetRight; // 总内边距
    CGFloat availableWidth = totalWidth - totalSpacing - totalInset; // 用于item的总可用宽度
    
    CGFloat itemWidth = availableWidth / itemsPerRow; // 计算item的宽度（和高度一样）
    ((UICollectionViewFlowLayout *)self.colorGameView.collectionView.collectionViewLayout).itemSize = CGSizeMake(itemWidth, itemWidth); // 设置item大小
//    NSLog(@"%f", itemWidth);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
