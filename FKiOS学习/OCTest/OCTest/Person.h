//
//  Person.h
//  OCTest
//
//  Created by 张旭洋 on 2023/5/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property NSString* name;
@property int age;

- (id)initWithName: (NSString*)name andAge: (int)age;
@end

NS_ASSUME_NONNULL_END
