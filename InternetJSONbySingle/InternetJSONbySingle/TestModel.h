//
//  TestModel.h
//  InternetJSONbySingle
//
//  Created by 张旭洋 on 2023/10/22.
//

#import <JSONModel/JSONModel.h>

//定义两组协议来规范TestModel类中的属性
@protocol StoriesModel
@end

@protocol Top_StoriesModel
@end

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoriesModel : JSONModel

@property (nonatomic, copy) NSString* image_hue;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* url;
@property (nonatomic, copy) NSString* hint;
@property (nonatomic, copy) NSString* id;

@end

@interface Top_StoriesModel : JSONModel

@property (nonatomic, copy) NSString* image_hue;
@property (nonatomic, copy) NSString* hint;
@property (nonatomic, copy) NSString* url;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* id;

@end

@interface TestModel : JSONModel

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSArray<StoriesModel> *stories;
@property (nonatomic, copy) NSArray<Top_StoriesModel> *top_stories;

@end


NS_ASSUME_NONNULL_END

