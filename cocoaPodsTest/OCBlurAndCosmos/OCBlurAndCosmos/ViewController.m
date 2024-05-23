//
//  ViewController.m
//  OCBlurAndCosmos
//
//  Created by 张旭洋 on 2024/4/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"mainBackGround.jpg"]];
    imageView.frame = self.view.bounds;
    [self.view addSubview: imageView];
    
    /*
     UIBlurEffectStyleExtraLight,
     UIBlurEffectStyleLight,
     UIBlurEffectStyleDark,
     UIBlurEffectStyleExtraDark API_AVAILABLE(tvos(10.0)) API_UNAVAILABLE(ios) API_UNAVAILABLE(watchos),

   Styles which automatically show one of the traditional blur styles,
   depending on the user interface style.
   
   Regular displays either Light or Dark.
   
    // UIBlurEffectStyleRegular API_AVAILABLE(ios(10.0)),
     Prominent displays either ExtraLight, Dark (on iOS), or ExtraDark (on tvOS).
     
    // UIBlurEffectStyleProminent API_AVAILABLE(ios(10.0)),
     */
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialDark];
    /*
     UIBlurEffectStyleSystemUltraThinMaterial        API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemThinMaterial             API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemMaterial                 API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemThickMaterial            API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemChromeMaterial           API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),

     
     UIBlurEffectStyleSystemUltraThinMaterialLight   API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemThinMaterialLight        API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemMaterialLight            API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemThickMaterialLight       API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemChromeMaterialLight      API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),

     UIBlurEffectStyleSystemUltraThinMaterialDark    API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemThinMaterialDark         API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemMaterialDark             API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemThickMaterialDark        API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos),
     UIBlurEffectStyleSystemChromeMaterialDark       API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos) API_UNAVAILABLE(tvos)
     */

    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];

    effectview.frame = CGRectMake(77, 177, 277, 377);
    effectview.alpha = .6;
    [self.view addSubview:effectview];
    
    
    
    
}


@end
