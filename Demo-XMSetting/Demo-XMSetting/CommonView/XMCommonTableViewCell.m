//
//  XMCommonTableViewCell.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMCommonTableViewCell.h"

#import "FMSettingViewModel.h"
@interface XMCommonTableViewCell ()

@end

@implementation XMCommonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier: reuseIdentifier]) {
        if (self) {
//            [self initializeView];
        }
    }
    return self;
}

- (void)setCellUIByData:(FMSettingViewModel *)cellModel {
    self.textLabel.text = cellModel.cellTitle;
    
}
@end
