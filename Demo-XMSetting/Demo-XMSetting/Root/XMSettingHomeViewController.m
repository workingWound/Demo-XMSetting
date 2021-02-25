//
//  XMSettingHomeViewController.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMSettingHomeViewController.h"

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
    
    XMSettingTextItem *accountDetail = [XMSettingTextItem itemWithTitle:@"帐户详情" action:^{
        NSLog(@"帐户详情");
    }];
    
    XMSettingSection *second = [[XMSettingSection alloc]init];
    second.settingItems = @[accountDetail];
    
    XMSettingTextItem *settingItem = [XMSettingTextItem itemWithTitle:@"功能设置" action:^{
        NSLog(@"功能设置");
    }];
    
    XMSettingSection *third = [[XMSettingSection alloc]init];
    third.settingItems = @[settingItem];
    
    return @[first, second, third];
}



@end
