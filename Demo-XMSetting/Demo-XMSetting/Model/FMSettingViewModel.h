//
//  FMSettingViewModel.h
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface FMSettingViewModel : NSObject

typedef enum{
    kFMTableViewCellTypeDefault = 0,
    kFMTableViewCellTypeSwitch,
    kFMTableViewCellTypeStaticText,
    kFMTableViewCellTypeEditableText,
    kFMTableViewCellTypeAvatar,
    kFMTableViewCellTypeCheckbox,   // 单选，“对勾”icon位于cell右侧
    kFMTableViewCellTypeMultiSelector,  // 多选，“对勾”icon位于cell左侧
    kFMTableViewCellTypeNotifySwitch,  //文件夹通知页面中的开关cell
    kFMTableViewCellTypeImage,
    kFMTableViewCellTypeAccount, // 账号专用 cell
}FMTableViewCellType;

@property (nonatomic, strong) NSString *cellTitle;//cell默认显示的文字
@property (nonatomic, strong) NSString *attributeStr;//额外需要显示的文字
@property (nonatomic, strong) NSString *settingKey;//这个cell对应于setting的key
@property (nonatomic, strong) NSString *key;//用于连接cell的action和cell本身的标识
@property (nonatomic) FMTableViewCellType cellType;//这个数据源要用怎样的方式渲染
@property (nonatomic) UITableViewCellAccessoryType accecoryType;//控制UITableViewCell的样式
//@property (nonatomic, strong) FMAccount *accountInfo;//数据源绑定的account
@property (nonatomic, assign) BOOL isOn;//控制checkbox类的数据源开关状态
@property (nonatomic, assign) BOOL isEditable;//控制控件是否可以编辑
@property (nonatomic, strong) UIImage *image;//控制image类的图片
//@property (nonatomic, strong) FMFolderPushState *folderState;//供新邮件提醒用的
@property (nonatomic, strong) NSString *placeholder; // 可编辑cell的placeholder
@property (nonatomic, assign) BOOL isDisabled;  //是否可以点击
@property (nonatomic, assign) BOOL showNewTips; //是否在文字旁显示“New”提示

- (id)initCellModelWithTitile:(NSString*)title;
- (id)initCellModelWithTitile:(NSString*)title andType:(UITableViewCellAccessoryType)cellType;
- (NSString *)cellResueIdentifier;

@end

NS_ASSUME_NONNULL_END
