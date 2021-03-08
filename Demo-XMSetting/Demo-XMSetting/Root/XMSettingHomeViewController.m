//
//  XMSettingHomeViewController.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMSettingHomeViewController.h"
#import "XMSettingAccountCell.h"
#import "FMSettingViewModel.h"
#import "XMSettingRootViewController.h"
#import "FMAccount.h"

@implementation XMSettingAccountItem

+ (XMSettingAccountItem *)itemWithAccount:(FMAccount *)account action:(void (^)())action;
{
    XMSettingAccountItem *item = [[XMSettingAccountItem alloc ]init];
    static NSString *cellKey = @"XMSettingAccountItemCell";
    item.cellForRow = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        XMSettingAccountCell *cell = (XMSettingAccountCell *)[tableView dequeueReusableCellWithIdentifier:cellKey];
        if (!cell) {
            cell = [[XMSettingAccountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellKey];
        }
        FMSettingViewModel *vm = [[FMSettingViewModel alloc]initCellModelWithTitile:account.name];
        vm.attributeStr = account.detail;
        [cell setCellUIByData:vm];
        return cell;
    };
    
    item.didSelect = ^(NSIndexPath * _Nonnull indexPath) {
        if (action) {
            action();
        }
    };
    
    item.heightForRow = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 50;
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
//    __weak __typeof(self)weakSelf = self;
    

    XMSettingTextItem *my = [XMSettingTextItem itemWithTitle:@"我的邮箱" action:^{
        NSLog(@"我的邮箱");
    }];
    
    XMSettingSection *first = [[XMSettingSection alloc]init];
    first.settingItems = @[my];
    
    NSMutableArray *secondItems = [NSMutableArray array];
    
    
    FMAccount *account1 = [[FMAccount alloc]init];
    account1.name = @"760625430";
    account1.detail = @"760625430@qq.com";
    
    FMAccount *account2 = [[FMAccount alloc]init];
    account2.name = @"ios.test";
    account2.detail = @"ios.test@qq.com";
    
    FMAccount *account3 = [[FMAccount alloc]init];
    account3.name = @"zcb119";
    account3.detail = @"zcb119@qq.com";
    
    [secondItems addObject:[XMSettingAccountItem itemWithAccount:account1 action:^{
    }]];
    [secondItems addObject:[XMSettingAccountItem itemWithAccount:account2 action:^{
    }]];
    [secondItems addObject:[XMSettingAccountItem itemWithAccount:account3 action:^{
    }]];
    
    XMSettingSection *second = [[XMSettingSection alloc]init];
    second.settingItems = secondItems;
    
    XMSettingTextItem *settingItem = [XMSettingTextItem itemWithTitle:@"功能设置" action:^{
        XMSettingRootViewController *vc = [[XMSettingRootViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    XMSettingSection *third = [[XMSettingSection alloc]init];
    third.settingItems = @[settingItem];
    
    return @[first, second, third];
}



@end
