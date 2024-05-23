//
//  Manager.h
//  ColorScheme
//
//  Created by 张旭洋 on 2024/3/23.
//

#import <Foundation/Foundation.h>
#import "ColorSchemeModel.h"
#import "AddNameModel.h"
#import "DeleteNameModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ColorModelBlock)(ColorSchemeModel *colorModel);
typedef void(^AddNameBlock)(AddNameModel* addNameModel);
typedef void(^DeleteNameBlock)(DeleteNameModel* deleteNameModel);
typedef void(^ErrorBlock)(NSError *error);

@interface Manager : NSObject

+ (instancetype)sharedManager;

- (void)requestColoringScheme: (NSString *)token success: (ColorModelBlock)success failure: (ErrorBlock)failure;
//- (void)requestResultForAddingName: (NSString *)name success:(AddNameBlock)success failure: (ErrorBlock)failure;
- (void)requestResultForAddingName:(NSString *)name withToken: (NSString *)token success:(AddNameBlock)success failure:(ErrorBlock)failure;
//- (void)requestResultForAddingName: (NSString *)name withToken: (NSString *)token;
- (void)requestResultForDeletingName:(NSString *)name withToken: (NSString *)token success:(DeleteNameBlock)success failure:(ErrorBlock)failure;

@end

NS_ASSUME_NONNULL_END
