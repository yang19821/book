//
//  tableFooterView.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "tableFooterView.h"
#import "tallyViewController.h"
@implementation tableFooterView
+ (UIView *)creatFooterView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PM_w,200)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:view.frame];
    imageView.image = [UIImage imageNamed:@"beijing"];
    [view addSubview:imageView];
    //button
    UIButton *btn = [[UIButton alloc] init];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(60);
//        make.center.mas_equalTo(view);
        make.centerX.mas_equalTo(view);
        make.top.mas_equalTo(view.mas_top).offset(30);
    }];
    btn.backgroundColor = chengse;
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"记一笔" forState:UIControlStateNormal];
    btn.titleLabel.textColor = UIColor.whiteColor;
    [btn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [btn addTarget:self action:@selector(clickAddMoney) forControlEvents:UIControlEventTouchUpInside];
    return view;
}
+ (void)clickAddMoney{
    //跳转到记一笔
    UITabBarController *tabBarVc = (UITabBarController *)UIApplication.sharedApplication.windows.firstObject.rootViewController;
        UINavigationController *nav = (UINavigationController *)tabBarVc.selectedViewController;
    tallyViewController *tallyVc = [[tallyViewController alloc] init];
        [nav pushViewController:tallyVc animated:YES];
    
}
@end
