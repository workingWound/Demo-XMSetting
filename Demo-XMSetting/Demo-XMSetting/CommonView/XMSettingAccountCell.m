//
//  XMSettingAccountCell.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMSettingAccountCell.h"
#import "FMSettingViewModel.h"

@interface XMSettingAccountCell ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation XMSettingAccountCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier: reuseIdentifier]) {
        if (self) {
            [self initSubViews];
            self.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    return self;
}

- (void)initSubViews
{
    _avatarView = [[UIImageView alloc]init];
    _avatarView.layer.masksToBounds = YES;
    _avatarView.layer.cornerRadius = 5;
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    
    _detailLabel = [[UILabel alloc]init];
    _detailLabel.font = [UIFont systemFontOfSize:12];
    
    [self.contentView addSubview:_avatarView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_detailLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat space = 10;
    [_titleLabel sizeToFit];
    [_detailLabel sizeToFit];
    
    _avatarView.frame = CGRectMake(space, space, 30, 30);
    
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_avatarView.frame) + space, space, 200, 20);
    
    _detailLabel.frame = CGRectMake(CGRectGetMinX(_titleLabel.frame), CGRectGetMaxY(_titleLabel.frame) + 5, CGRectGetWidth(_titleLabel.frame), 15);
}

- (void)setCellUIByData:(FMSettingViewModel *)vm
{
    _titleLabel.text = vm.cellTitle;
    
    _detailLabel.text = vm.attributeStr;
    
    _avatarView.backgroundColor = [UIColor systemBlueColor];
}
@end
