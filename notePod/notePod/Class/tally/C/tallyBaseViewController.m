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
    self = [super init];
    //背景图
    UIImageView *imagev = [[UIImageView alloc] initWithFrame:self.view.frame];
    imagev.image = [UIImage imageNamed:@"background"];
    [self.view addSubview:imagev];
    //baseview
    [self.baseView setColorWithThemeColor:color];
    [self.view addSubview:self.baseView];

    return self;
}
- (tallyBaseView *)baseView{
    if (!_baseView) {
        _baseView = [tallyBaseView initTallyBaseViewWithFrame:self.view.frame];
    }
    return _baseView;
}

@end
