//
//  FMSettingViewModel.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "FMSettingViewModel.h"
#import <UIKit/UIKit.h>
@implementation FMSettingViewModel

- (id)initCellModelWithTitile:(NSString*)title {
    if (self = [super init]) {
        _cellTitle = title;
        _cellType  = kFMTableViewCellTypeDefault;
        _accecoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

- (id)initCellModelWithTitile:(NSString*)title andType:(UITableViewCellAccessoryType)cellType {
    if (self = [super init]) {
        _cellTitle = title;
        _accecoryType = cellType;
    }
    return self;
}

- (NSString *)cellResueIdentifier {
    return [NSString stringWithFormat:@"%d", (int)_cellType];
}

@end
