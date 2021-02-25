//
//  XMSettingHomeViewController.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMSettingHomeViewController.h"
#import "XMSettingAccountCell.h"
#import "FMSettingViewModel.h"
@implementation XMSettingAccountItem

+ (XMSettingAccountItem *)itemWithAccount:(NSInteger )account action:(void (^)())action
{
    XMSettingAccountItem *item = [[XMSettingAccountItem alloc ]init];
    static NSString *cellKey = @"XMSettingAccountItemCell";
    item.cellForRow = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        XMSettingAccountCell *cell = (XMSettingAccountCell *)[tableView dequeueReusableCellWithIdentifier:cellKey];
        if (!cell) {
            cell = [[XMSettingAccountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellKey];
        }
        FMSettingViewModel *vm = [[FMSettingViewModel alloc]initCellModelWithTitile:[NSString stringWithFormat:@"%ld",(long)account]];
        vm.attributeStr = [NSString stringWithFormat:@"%ld",(long)account];
        [cell setCellUIByData:vm];
        return cell;
    };
    
    item.didSelect = ^(NSIndexPath * _Nonnull indexPath) {
        if (action) {
            action();
        }
    };
    
    return item;
}

@end

@interface XMSettingHomeViewController ()

@property (nonatomic, strong) NSArray<XMSettingSection *> *dataSource;
@end

@implementation XMSettingHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}

- (NSArray<XMSettingSection *> *)settingSections
{
    __weak __typeof(self)weakSelf = self;
    

    XMSettingTextItem *my = [XMSettingTextItem itemWithTitle:@"我的邮箱" action:^{
        NSLog(@"我的邮箱");
    }];
    
    XMSettingSection *first = [[XMSettingSection alloc]init];
    first.settingItems = @[my];
    
    NSMutableArray *secondItems = [NSMutableArray array];
    
    
    for (int i = 0; i < 3; i++) {
        XMSettingAccountItem *item = [XMSettingAccountItem itemWithAccount:(i * 100) action:^{
            NSLog(@"打印账号 -- %d",i * 100);
        }];
        [secondItems addObject:item];
    }
    XMSettingSection *second = [[XMSettingSection alloc]init];
    second.settingItems = secondItems;
    
    XMSettingTextItem *settingItem = [XMSettingTextItem itemWithTitle:@"功能设置" action:^{
        NSLog(@"功能设置");
    }];
    
    XMSettingSection *third = [[XMSettingSection alloc]init];
    third.settingItems = @[settingItem];
    
    return @[first, second, third];
}



@end
