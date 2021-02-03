//
//  zhichuViewController.m
//  notePod
//
//  Created by Choice on 2021/2/3.
//

#import "tallyBaseViewController.h"
#import "tallyBaseView.h"
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
    tallyBaseView *baseView = [tallyBaseView initTallyBaseViewWithFrame:self.view.frame];
    [baseView setColorWithThemeColor:color];
    [self.view addSubview:baseView];
    //手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:imagev action:@selector(clickView)];
    [imagev addGestureRecognizer:tapGesture];
    return self;
}
- (void)clickView{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
