//
//  XiyouMobilePerson.m
//  OCTest
//
//  Created by 张旭洋 on 2023/5/28.
//

#import "XiyouMobilePerson.h"

@implementation XiyouMobilePerson

- (void)setIOS: (int)iOS {
    _iOS = (iOS % 2 == 0) ? (iOS - 1) : (iOS + 1);
}
- (int)iOS {
    return _iOS;
}

- (void)setWeb: (int)web {
    _web = web;
}
- (int)web {
    return _web;
}

- (void)setAndroid: (NSString*)android {
    _android = android;
}
- (NSString*)android {
    return _android;
}

- (void)setServer: (NSString*)server {
    _server = server;
}
- (NSString*)server {
    return _server;
}

- (void)caculate: (int)iOS plusWeb: (int)web {
    NSLog(@"iOS与web两个变量之和为：%d", iOS + web);
}
@end
