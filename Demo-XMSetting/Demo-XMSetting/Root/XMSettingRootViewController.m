//
//  XMSettingRootViewController.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMSettingRootViewController.h"

@interface XMSettingRootViewController ()

@end

@implementation XMSettingRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray<XMSettingSection *> *)settingSections
{
    
    XMSettingTextItem *pushItem = [XMSettingTextItem itemWithTitle:@"新邮件提醒" action:^{
        //实现对应action
    }];
    
    XMSettingSection *first = [[XMSettingSection alloc]init];
    first.settingItems = @[pushItem];
    
    XMSettingTextItem *privateItem = [XMSettingTextItem itemWithTitle:@"隐私" action:^{
        
    }];
    
    XMSettingTextItem *generalItem = [XMSettingTextItem itemWithTitle:@"通用" action:^{
        
    }];
    
    XMSettingTextItem *mailItem = [XMSettingTextItem itemWithTitle:@"邮件" action:^{
        
    }];
    XMSettingSection *second = [[XMSettingSection alloc]init];
    second.settingItems = @[privateItem, generalItem, mailItem];
    
    XMSettingTextItem *storageItem = [XMSettingTextItem itemWithTitle:@"储存" action:^{
        
    }];
    XMSettingSection *third = [[XMSettingSection alloc]init];
    third.settingItems = @[storageItem];
    
    
    
    XMSettingTextItem *reportItem = [XMSettingTextItem itemWithTitle:@"帮助反馈" action:^{
        
    }];
    
    XMSettingTextItem *aboutItem = [XMSettingTextItem itemWithTitle:@"关于" action:^{
        
    }];

    XMSettingSection *forth = [[XMSettingSection alloc]init];
    forth.settingItems = @[reportItem, aboutItem];
    
    return @[first, second, third, forth];
}



@end
