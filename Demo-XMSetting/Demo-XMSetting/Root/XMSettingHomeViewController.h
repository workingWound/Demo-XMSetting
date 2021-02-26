//
//  XMSettingHomeViewController.h
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMSettingViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class FMAccount;

@interface XMSettingAccountItem : XMSettingItem

+ (XMSettingAccountItem *)itemWithAccount:(FMAccount *)account action:(void (^)())action;

@end


@interface XMSettingHomeViewController : XMSettingViewController


@end

NS_ASSUME_NONNULL_END
