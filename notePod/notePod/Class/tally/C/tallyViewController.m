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
    self.view.backgroundColor = UIColor.yellowColor;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
#pragma mark add and masonry
- (void)MasonryAndAdd{
    [self.view addSubview:self.scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.mas_equalTo(self.view);
        
    }];
    [self.view addSubview:self.segment];
    [_segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(200);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
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
    }
    return _scrollView;
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
