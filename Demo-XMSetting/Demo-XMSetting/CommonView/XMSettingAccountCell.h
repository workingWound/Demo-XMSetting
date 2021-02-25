//
//  XMSettingAccountCell.h
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FMSettingViewModel;
@interface XMSettingAccountCell : UITableViewCell

- (void)setCellUIByData:(FMSettingViewModel *)vm;
@end

NS_ASSUME_NONNULL_END
