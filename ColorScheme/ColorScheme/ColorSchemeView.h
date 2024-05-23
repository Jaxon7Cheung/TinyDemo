//
//  ColorSchemeView.h
//  ColorScheme
//
//  Created by 张旭洋 on 2024/3/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ConfirmAddDelegate <NSObject>

- (void)addNameView: (BOOL)isAdd;
- (void)removeNameView;
- (void)confirmAddName: (BOOL)isAdd;

@end

@interface ColorSchemeView : UIView

@property (nonatomic, strong)UITableView* tableView;
@property (nonatomic, strong)UICollectionView* collectionView;
@property (nonatomic, weak)id<ConfirmAddDelegate> delegate;
@property (nonatomic, strong)UIButton* addNameButton;
@property (nonatomic, strong)UIButton* deleteNameButton;

@property (nonatomic, strong)UIView* view;
@property (nonatomic, strong)UILabel* nameLabel;
@property (nonatomic, strong)UIView* alertView;
@property (nonatomic, strong)UITextField* textField;
@property (nonatomic, strong)UIButton* confirmAddButton;

- (void)initNameView:(BOOL)isAdd;
- (void)addNameView;
- (void)removeNameView;

@end

NS_ASSUME_NONNULL_END
