//
//  ColorBlockModel.h
//  ColorBlockGame
//
//  Created by 张旭洋 on 2024/2/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorBlockModel : NSObject

@property (nonatomic, strong)UIColor* color;
@property (nonatomic, assign)BOOL isDifferent;

@end

NS_ASSUME_NONNULL_END
