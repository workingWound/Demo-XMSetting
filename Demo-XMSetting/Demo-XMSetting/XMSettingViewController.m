//
//  XMSettingViewController.m
//  Demo-XMSetting
//
//  Created by kawhi on 2021/2/25.
//

#import "XMSettingViewController.h"
#import "FMSettingViewModel.h"
#import "XMCommonTableViewCell.h"
@implementation XMSettingSection
@end

@implementation XMSettingItem
@end

@implementation XMSettingTextItem

+ (XMSettingTextItem *)itemWithTitle:(NSString *)title action:(void (^)(void))action {
    return [self itemWithTitle:title subTitle:nil action:action];
}

+ (XMSettingTextItem *)itemWithTitle:(NSString *)title subTitle:(nullable NSString *)subTitle action:(nonnull void (^)(void))action
{
    XMSettingTextItem *item = [[self alloc]init];
    static NSString *cellKey = @"XMSettingTextItemCell";
//    __weak XMSettingTextItem *weakItem = item;
    item.cellForRow = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        XMCommonTableViewCell *cell = (XMCommonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellKey];
        if (!cell) {
            cell = [[XMCommonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellKey];
        }
        
        FMSettingViewModel *vm = [[FMSettingViewModel alloc]initCellModelWithTitile:title];
        vm.attributeStr = subTitle;
        vm.cellType = kFMTableViewCellTypeStaticText;
        vm.accecoryType = UITableViewCellAccessoryDisclosureIndicator;
        
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

@interface XMSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray<XMSettingSection*> *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XMSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateSections];
    [_tableView reloadData];
}


- (void)initSubViews
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), .1)];
    _tableView.backgroundColor = [UIColor systemGray6Color];
    _tableView.sectionHeaderHeight = 10;
    _tableView.sectionFooterHeight = 10;
//    _tableView.
    [self.view addSubview:_tableView];
    
}

- (void)updateSections
{
    self.dataSource = [self settingSections];
}

- (void)delayReloadData{
    _tableView.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        self.tableView.userInteractionEnabled = YES;
    });
}


- (NSArray<XMSettingSection *> *)settingSections
{
    return @[];
}

- (XMSettingItem *)itemForIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    XMSettingSection *sectionData = [self.dataSource objectAtIndex:section];
    XMSettingItem *item = [sectionData .settingItems objectAtIndex:row];
    return item;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    XMSettingSection *sectionData = [self.dataSource objectAtIndex:section];
    return sectionData.settingItems.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMSettingItem *item = [self itemForIndexPath:indexPath];
    if (item.didSelect) {
        item.didSelect(indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMSettingItem *item = [self itemForIndexPath:indexPath];
    if (item.heightForRow) {
        return item.heightForRow((UITableView *)tableView,indexPath);
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMSettingItem *item = [self itemForIndexPath:indexPath];
    return item.cellForRow((UITableView *)tableView,indexPath);
}

@end
