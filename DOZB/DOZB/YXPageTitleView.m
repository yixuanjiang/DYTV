//
//  YXPageTitleView.m
//  DOZB
//
//  Created by 蒋毅轩 on 2017/10/16.
//  Copyright © 2017年 蒋毅轩. All rights reserved.
//

#import "YXPageTitleView.h"

#define kSelectTitleColor [UIColor redColor]
#define kScrollLineH 2
#define kNormalTitleColor [UIColor grayColor]
#define kTitleMargin 10

@interface YXPageTitleView ()

/***   标签文本数组   */
@property (nonatomic, strong) NSArray *titles;
/***   是否运行滚动   */
@property (nonatomic, assign) BOOL isScrollEnable;
/***   滚动视图   */
@property (nonatomic, strong) UIScrollView *scrollView;
/***   指示器   */
@property (nonatomic, strong) UIView *scrollLine;
/***   标签Label数组   */
@property (nonatomic, strong) NSMutableArray *titleLabels;

@end

@implementation YXPageTitleView

- (NSMutableArray *)titleLabels
{
    if (_titleLabels == nil) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}

- (instancetype)initWithFrame:(CGRect)frame isScrollEnable:(BOOL)isScrollEnable titles:(NSArray *)titles
{
    if ([super initWithFrame:frame]) {
        self.isScrollEnable = isScrollEnable;
        self.titles = [NSArray arrayWithArray:titles];
        /***   设置UI界面
         添加UIScrollView，如果标题过多，则可以滚动
         初始化所有的Label，用于显示标题。并且给label添加监听手势
         添加顶部线和滑块的View
         */
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        //self.scrollView.scrollsToTop = NO;
        //self.scrollView.bounces = NO;
        self.scrollView.backgroundColor = [UIColor greenColor];
        //设置滚动范围
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width, 0);
        
        self.scrollLine = [[UIView alloc] init];
        self.scrollLine.backgroundColor = kSelectTitleColor;
        
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{
    // 1.添加scrollView
    [self addSubview:self.scrollView];
    // 2.初始化labels
    [self setupTitleLabels];
    // 3.添加定义的线段和滑动的滑块
    [self setupBottomlineAndScrollline];
}

- (void)setupTitleLabels{
    CGFloat titleY = 0;
    CGFloat titleH = self.frame.size.height - kScrollLineH;
    NSInteger count = self.titles.count;
    
    for (NSInteger i = 0; i < self.titles.count; i++) {
        NSString *title = self.titles[i];
        // 1.创建Label
        UILabel *label = [[UILabel alloc] init];
        // 2.设置Label的属性
        label.text = title;
        label.tag = i;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = kNormalTitleColor;
        label.font = [UIFont systemFontOfSize:16];
        [self.titleLabels addObject:label];
        // 3.设置label的frame
        CGFloat titleW = 0;
        CGFloat titleX = 0;
        if (!self.isScrollEnable) {
            titleW = self.frame.size.width / count;
            titleX = i * titleW;
        }else{
            CGSize size = [title boundingRectWithSize:CGSizeMake((MAXFLOAT), 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil].size;
            titleW = size.width;
            if (i != 0) {
                UILabel *lab = self.titleLabels[i - 1];
                titleX = CGRectGetMaxX(lab.frame) + kTitleMargin;
            }
        }
        NSLog(@"%lf,%lf,%lf,%lf",titleX,titleY,titleW,titleH);
        label.frame = CGRectMake(titleX, titleY, titleW, titleH);
        // 4.将Label添加到父控件中
        label.backgroundColor = [UIColor yellowColor];
        [self.scrollView addSubview:label];
        // 5.监听label的点击
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick)];
        [label addGestureRecognizer:tapGes];
    }
}

- (void)setupBottomlineAndScrollline{
    // 1.添加bottomline
    UIView *bottomline = [[UIView alloc] init];
    bottomline.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
    [self addSubview:bottomline];
    
    // 2.设置滑块的view
    [self addSubview:self.scrollLine];

}

#pragma mark - 标签文本点击
- (void)titleLabelClick{
}

@end
