//
//  XiyouMobilePerson.h
//  OCTest
//
//  Created by 张旭洋 on 2023/5/28.
//

#import "Person.h"
#import "Demand.h"

NS_ASSUME_NONNULL_BEGIN

@interface XiyouMobilePerson : Person <Demand> {
    @protected
    int _iOS;
    int _web;
    NSString* _android;
    NSString* _server;
}

- (void)setIOS: (int)iOS;
- (int)iOS;
- (void)setWeb: (int)web;
- (int)web;
- (void)setAndroid: (NSString*)android;
- (NSString*)android;
- (void)setServer: (NSString*)server;
- (NSString*)server;
@end

NS_ASSUME_NONNULL_END
