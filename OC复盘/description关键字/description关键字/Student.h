//
//  Student.h
//  description关键字
//
//  Created by 张旭洋 on 2023/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (copy, nonatomic)NSString* name;
@property (assign, nonatomic)NSInteger age;

@property (copy, nonatomic)NSString* stuID;

- (void)showMessage;

@end

NS_ASSUME_NONNULL_END
