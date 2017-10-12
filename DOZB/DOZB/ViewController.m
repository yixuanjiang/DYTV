//
//  ViewController.m
//  DOZB
//
//  Created by 蒋毅轩 on 2017/10/12.
//  Copyright © 2017年 蒋毅轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupNavigationLeftBar];
    [self setupNavigationRightBar];
}

- (void)setupNavigationLeftBar
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)setupNavigationRightBar
{
    // 1.确定UIButton的尺寸
    CGSize size = CGSizeMake(40, 44);
    
    // 2.创建历史的Item
    UIButton *historyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [historyBtn setImage:[UIImage imageNamed:@"image_my_history"] forState:UIControlStateNormal];
    [historyBtn setImage:[UIImage imageNamed:@"Image_my_history_click"] forState:UIControlStateHighlighted];
    [historyBtn addTarget:self action:@selector(historyItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *historyItem = [[UIBarButtonItem alloc] initWithCustomView:historyBtn];
    
    // 3.创建搜索的Item
    UIButton *searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [searchBtn setImage:[UIImage imageNamed:@"btn_search"] forState:UIControlStateNormal];
    [searchBtn setImage:[UIImage imageNamed:@"btn_search_clicked"] forState:UIControlStateHighlighted];
    [searchBtn addTarget:self action:@selector(searchItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    
    // 4.创建二维码的Item
    UIButton *qrcodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [qrcodeBtn setImage:[UIImage imageNamed:@"Image_scan"] forState:UIControlStateNormal];
    [qrcodeBtn setImage:[UIImage imageNamed:@"Image_scan_click"] forState:UIControlStateHighlighted];
    [qrcodeBtn addTarget:self action:@selector(qrCodeItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *qrcodeItem = [[UIBarButtonItem alloc] initWithCustomView:qrcodeBtn];
    
    self.navigationItem.rightBarButtonItems = @[historyItem,searchItem,qrcodeItem];
}

/***   左侧logo点击   */
- (void)leftItemClick{
}

/***   历史按钮点击   */
- (void)historyItemClick{
}

/***   搜索按钮点击   */
- (void)searchItemClick{
}

/***   二维码点击   */
- (void)qrCodeItemClick{
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
