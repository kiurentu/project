//
//  TabBarViewController.m
//  DoctorAndE
//
//  Created by skytoup on 14-11-3.
//  Copyright (c) 2014年 skytoup. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "MedicalCentreViewController.h"
#import "HealthStoreViewController.h"
#import "AppCentreViewController.h"
#import "PersonalCentreViewController.h"

#define NTFC_SELECT_INDEX @"ntfcSelectIndex" // 一个切换选项卡的通知
#define COLOR_MAIN RGBA(20.0f, 166.0f, 116.0f, 1.0f) // 主色调
#define BTN_TAG_ADD 1234 // btn的tag对应index的增加值
#define LABEL_TAG 1001 // btn中的标签tag

@implementation UIButton (Select)
// 设置按钮选中
- (void)setIsSelect:(BOOL)isSelect{
    self.selected = isSelect;
    UILabel *lb = (UILabel*)[self viewWithTag:LABEL_TAG];

    if(isSelect){
        self.backgroundColor = COLOR_MAIN;
        lb.textColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor whiteColor];
        lb.textColor = COLOR_MAIN;
    }
}
@end


@interface TabBarViewController ()

@end

@implementation TabBarViewController

+ (void)notificationSelectIndex:(SelectIndex) SelectIndex {
    [[NSNotificationCenter defaultCenter] postNotificationName:NTFC_SELECT_INDEX object:@(SelectIndex)];
}

// 收到通知
- (void)ntfcSelectIndex:(NSNotification*) notification {
    int i = [notification.object intValue];
    [self chooseIndex:i];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ntfcSelectIndex:) name:NTFC_SELECT_INDEX object:nil];
        [self addTabBar];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationController *home = [self createAndInitNavigationController:[HomeViewController class]];
    UINavigationController *medicalCentre = [self createAndInitNavigationController:[MedicalCentreViewController class]];
    UINavigationController *healthStore = [self createAndInitNavigationController:[HealthStoreViewController class]];
    UINavigationController *appCentre = [self createAndInitNavigationController:[AppCentreViewController class]];
    UINavigationController *personalCentre = [self createAndInitNavigationController:[PersonalCentreViewController class]];
    
    self.viewControllers = @[home, medicalCentre, healthStore, appCentre, personalCentre];
    
}

// 添加自定义选项卡
- (void)addTabBar {
    UIView *bg = [[UIView alloc] init];
    bg.frame = self.tabBar.frame;
    bg.backgroundColor = [UIColor whiteColor];
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 0, bg.frame.size.width, 1);
    line.backgroundColor = COLOR_MAIN;
    [bg addSubview:line];
    [self.view addSubview:bg];
    
    NSArray *norImg = @[@"首页_normal", @"医疗中心_normal", @"健康商城_normal", @"应用中心_normal", @"个人中心_normal"];
    NSArray *selImg = @[@"首页_pressed", @"医疗中心_pressed", @"健康商城_pressed", @"应用中心_pressed", @"个人中心_pressed"];
    NSArray *title = @[@"首页", @"医疗中心", @"健康商城", @"应用中心", @"个人中心"];
    
    int h = bg.frame.size.height;
    int w = bg.frame.size.width / 5;
    
    for(int i=0; i!=5; ++i){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(w * i, 1, w, h-1);
        [btn setImage:IMAGE(norImg[i]) forState:UIControlStateNormal];
        [btn setImage:IMAGE(norImg[i]) forState:UIControlStateHighlighted];
        [btn setImage:IMAGE(selImg[i]) forState:UIControlStateSelected];
        
        btn.tag = BTN_TAG_ADD + i;
        [btn addTarget:self action:@selector(tabClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.imageEdgeInsets = UIEdgeInsetsMake(-13, .0f, .0f, .0f);
        
        UILabel *lb = [[UILabel alloc] init];
        lb.text = title[i];
        lb.textColor = COLOR_MAIN;
        lb.backgroundColor = [UIColor clearColor];
        lb.font = [UIFont systemFontOfSize:12];
        [lb sizeToFit];
        CGRect f = lb.frame;
        lb.frame = (CGRect){ {(w-f.size.width)/2, 30}, f.size };
        lb.tag = LABEL_TAG;
        [btn addSubview:lb];
        
        if(btn.tag - BTN_TAG_ADD == 0){
            btn.selected = YES;
            [btn setIsSelect:YES];
        }
        
        [bg addSubview:btn];
    }
    
}

// 自定义Tab点击
- (void)tabClick:(UIButton*) sender {
    long tag = sender.tag - BTN_TAG_ADD;
    if(tag == self.selectedIndex){
        return;
    }
    for(int i=0; i!=5; ++i){
        [(UIButton*)[self.view viewWithTag:BTN_TAG_ADD + i] setIsSelect:NO];
    }
    [sender setIsSelect:YES];
    self.selectedIndex = tag;
}

// 选择选项卡
- (void)chooseIndex:(int) index {
    self.selectedIndex = index;
    
}

// 创建一个导航控制器
- (UINavigationController*)createAndInitNavigationController:(Class) class {
    __autoreleasing UINavigationController *nvc= [[UINavigationController alloc] initWithRootViewController:[[class alloc] init]];
    nvc.navigationBarHidden = YES;
    return nvc;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
