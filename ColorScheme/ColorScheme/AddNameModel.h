//
//  AddNameModel.h
//  ColorScheme
//
//  Created by 张旭洋 on 2024/3/24.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddNameModel : JSONModel

@property (nonatomic, copy)NSArray* data;
@property (nonatomic, copy)NSString* message;

@end

NS_ASSUME_NONNULL_END
