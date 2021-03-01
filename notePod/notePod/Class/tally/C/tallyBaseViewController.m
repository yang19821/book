//
//  zhichuViewController.m
//  notePod
//
//  Created by Choice on 2021/2/3.
//

#import "tallyBaseViewController.h"

@interface tallyBaseViewController ()

@end

@implementation tallyBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (instancetype)initWithThemeColor:(UIColor *)color{
    //背景图
    UIImageView *imagev = [[UIImageView alloc] initWithFrame:self.view.frame];
    imagev.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:imagev];
    //baseview
    _baseView = [tallyBaseView initTallyBaseViewWithFrame:self.view.frame];
    [_baseView setColorWithThemeColor:color];
    [self.view addSubview:_baseView];

    return self;
}


@end
