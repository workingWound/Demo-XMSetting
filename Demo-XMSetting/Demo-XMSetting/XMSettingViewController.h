//
//  XMSettingViewController.h
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import <UIKit/UIKit.h>

@class XMSettingItem;
NS_ASSUME_NONNULL_BEGIN


@interface XMSettingSection : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, strong) NSArray<XMSettingItem *> *settingItems;

@end


@interface XMSettingItem : NSObject

typedef void(^DidSelectBlock)(NSIndexPath *indexPath);
@property (nonatomic, copy) DidSelectBlock didSelect;

typedef UITableViewCell *_Nonnull(^CellForRowBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) CellForRowBlock cellForRow;

typedef CGFloat(^HeightForRowBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) HeightForRowBlock heightForRow;


@end

@interface XMSettingTextItem : XMSettingItem
+ (XMSettingTextItem *)itemWithTitle:(NSString *)title action:(void (^)(void))action;
+ (XMSettingTextItem *)itemWithTitle:(NSString *)title subTitle:(nullable NSString *)subTitle action:(void (^)(void))action;

@end


@interface XMSettingViewController : UIViewController
- (NSArray<XMSettingSection *> *)settingSections;

- (void)delayReloadData;
@end

NS_ASSUME_NONNULL_END
