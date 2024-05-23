//
//  ColorGameModel.h
//  ColorBlockGame
//
//  Created by 张旭洋 on 2024/2/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorGameModel : NSObject

@property (nonatomic, assign)NSInteger currentScore;
@property (nonatomic, assign)NSInteger topScore;
@property (nonatomic, assign)NSInteger level;
@property (nonatomic, assign)NSInteger health;

@end

NS_ASSUME_NONNULL_END
