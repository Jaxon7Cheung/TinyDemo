//
//  Book.h
//  复合类型
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (copy, nonatomic)NSString* name;
@property (assign, nonatomic)NSInteger pages;
@property (assign, nonatomic)NSInteger price;

@end

NS_ASSUME_NONNULL_END
