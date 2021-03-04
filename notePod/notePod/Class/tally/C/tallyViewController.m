//
//  tallyViewController.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "tallyViewController.h"
#import "mySqliteManage.h"
@interface tallyViewController () <UIScrollViewDelegate>

@property (nonatomic, assign) NSString *num; //收入数字
@property (nonatomic, copy) NSString *noteString; //收入备注


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
- (void)dealloc{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"TallyViewToController" object:nil];
}
#pragma mark click Mathord
- (void)successToEdit{
    //收起键盘
    [self clickView];
    //判断num是否不为0，写入数据库
    if (![_num isEqual:@0] && !(_num == nil)) {
        [self updateDB];
    }
    //返回主页
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)changeIndex{
    //segment改变调用
    CGFloat offsetX = PM_w * self.segment.selectedSegmentIndex;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
- (void)clickView{
    //收起键盘
    [UIApplication.sharedApplication.windows.firstObject endEditing:YES];
    
}
- (void)updateData:(NSNotification *)notification {
    //通知接收数据
    NSDictionary *dic = notification.object;
    self.num = dic[@"num"];
    self.noteString = dic[@"note"];
}
#pragma mark delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat x = offsetX / PM_w;
    int index = (int)round(x);
    self.segment.selectedSegmentIndex = index;
}
#pragma mark private Mothord
- (void)updateDB{
    //日期
    NSString *time_now = [[mySqliteManage sharedInstanceSqlite] getCurrentDate];
    //数据库操作
    [[mySqliteManage sharedInstanceSqlite] sqliteAddDataWithTime:time_now money:_num note:_noteString];
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
    self.scrollView.delegate = self;
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.segment.mas_bottom);
    }];
}

#pragma mark getter and setter
- (tallySegment *)segment{
    if (!_segment) {
        _segment = [tallySegment initTallySegment];
        [_segment addTarget:self action:@selector(changeIndex) forControlEvents:UIControlEventValueChanged];
    }
    return _segment;
}
- (tallyScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [tallyScrollView initTallyScrollView];
        //支出
        tallyBaseViewController *zhichuVC = [[tallyBaseViewController alloc] initWithThemeColor:guGreen];
        zhichuVC.view.frame = CGRectMake(0, 0, PM_w, _scrollView.bounds.size.height);
        zhichuVC.baseView.inputNumField.tag = 101;
        zhichuVC.baseView.noteTextView.tag = 102;

        [_scrollView addSubview:zhichuVC.view];
        //收入
        tallyBaseViewController *shouruVC = [[tallyBaseViewController alloc] initWithThemeColor:UIColor.redColor];
        shouruVC.view.frame = CGRectMake(PM_w, 0, 2*PM_w, _scrollView.bounds.size.height);
        
        [_scrollView addSubview:shouruVC.view];
        shouruVC.baseView.inputNumField.tag = 201;
        shouruVC.baseView.noteTextView.tag = 202;
        //手势-点击收起键盘
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView)];
        [_scrollView addGestureRecognizer:tapGesture];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData:) name:@"TallyViewToController" object:nil];
    return _scrollView;
}

@end
