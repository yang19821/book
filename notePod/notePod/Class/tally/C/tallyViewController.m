//
//  tallyViewController.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "tallyViewController.h"

@interface tallyViewController ()

@end

@implementation tallyViewController

#pragma mark lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self MasonryAndAdd];
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.title = @"记一笔";
    self.view.backgroundColor = UIColor.whiteColor;
    self.tabBarController.tabBar.hidden = YES;
    //完成按钮
    UIBarButtonItem *rightItme = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(successToEdit)];
    self.navigationItem.rightBarButtonItem = rightItme;
 
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
#pragma mark click Mathord
- (void)successToEdit{
    //完成跳转
}
#pragma mark add and masonry
- (void)MasonryAndAdd{
    
    [self.view addSubview:self.segment];
    [_segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(PM_w);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
    }];
    [self.view addSubview:self.scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.segment.mas_bottom);
    }];
}

#pragma mark getter and setter
- (tallySegment *)segment{
    if (!_segment) {
        _segment = [tallySegment initTallySegment];
    }
    return _segment;
}
- (tallyScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [tallyScrollView initTallyScrollView];
        tallyBaseViewController *zhichuVC = [[tallyBaseViewController alloc] initWithThemeColor:guGreen];
        zhichuVC.view.frame = CGRectMake(0, 0, PM_w, _scrollView.bounds.size.height);
        [_scrollView addSubview:zhichuVC.view];
        tallyBaseViewController *shouruVC = [[tallyBaseViewController alloc] initWithThemeColor:UIColor.redColor];
        shouruVC.view.frame = CGRectMake(PM_w, 0, 2*PM_w, _scrollView.bounds.size.height);
        [_scrollView addSubview:shouruVC.view];
    }
    return _scrollView;
}

@end
