//
//  ColorSchemeModel.h
//  ColorScheme
//
//  Created by 张旭洋 on 2024/3/23.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ColorSchemeModel : JSONModel

@property (nonatomic, copy)NSArray* data;
@property (nonatomic, strong)NSMutableArray* nameArray;
@property (nonatomic, strong)NSMutableArray<NSArray *>* rgbArray;

@end

NS_ASSUME_NONNULL_END
