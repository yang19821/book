//
//  homePageViewController.m
//  notePod
//
//  Created by Choice on 2021/1/12.
//

#import "homePageViewController.h"
#import "homePageTableViewController.h"
#import <SMS_SDK/SMSSDK.h>
@interface homePageViewController ()

@end

@implementation homePageViewController



#pragma mark lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    homePageTableViewController *tableVc = [[homePageTableViewController alloc] init];
    [self addChildViewController:tableVc];
    
    [self setColor];
    
    
}
- (void)MessageAuthentication{//短信验证功能
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"17521696445" zone:@"86" result:^(NSError *error) {
            
    }];
    [SMSSDK commitVerificationCode:@"123456" phoneNumber:@"17521696445" zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"打印---验证成功");
        }
        else {
            NSLog(@"错误信息---%@",error);
        }
    }];
}
#pragma mark UITableViewDelegate

#pragma mark customDelegate

#pragma mark eventResponse

#pragma mark privateMathods
- (void)setColor{//设置颜色
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
}

- (UIImage *)clipImageOfRound :(UIImage *)image{
    //获取上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //构造bezierpath
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //切割
    [imagePath addClip];
    //将图片加到path里面
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //获取图片
    UIImage *nweImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return nweImage;
}
#pragma mark getter and setter
@end
