//
//  homePageTableViewController.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "homePageTableViewController.h"
#import "homePageTableViewCell.h"
#import "tableHeaderView.h"
#import "tableFooterView.h"
#import "mySqliteManage.h"
@interface homePageTableViewController ()

@property (nonatomic, copy) NSDictionary *dateDic;//临时接收数据字典

@end
@implementation homePageTableViewController

#pragma mark lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    UIView *header = [tableHeaderView creatHeaderView];
    UIView *footer = [tableFooterView creatFooterView];
    self.tableView.tableHeaderView = header;
    self.tableView.tableFooterView = footer;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    
}
- (void)viewWillAppear:(BOOL)animated{
    //获取当前时间
   
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    homePageTableViewCell *cell = [homePageTableViewCell initWithReuseIdentifier:@"Cell"];
    if (indexPath.row == 0) {
        cell.title.text = @"今天";
     self.dateDic = [[mySqliteManage sharedInstanceSqlite] sqliteNumOfDay];
    }
    if (indexPath.row == 1) {
        cell.title.text = @"本周";
        self.dateDic = [[mySqliteManage sharedInstanceSqlite] sqliteNumOfWeek];
        
    }
   else if (indexPath.row == 2) {
        cell.title.text = @"本月";
       self.dateDic = [[mySqliteManage sharedInstanceSqlite] sqliteNumOfMonth];
    }
   else if (indexPath.row == 3){
       cell.title.text = @"本年";
       self.dateDic = [[mySqliteManage sharedInstanceSqlite] sqliteNumOfYear];
   }
    cell.income.text = self.dateDic[@"incomeNum"];
    cell.spending.text = self.dateDic[@"expendNum"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [[mySqliteManage sharedInstanceSqlite] sqliteNumOfWeek];
    }
    else if (indexPath.row == 1) {
        NSLog(@"点击---%ld",(long)indexPath.row);
     }
   else if (indexPath.row == 2) {
       NSLog(@"点击---%ld",(long)indexPath.row);
    }
   else {
       NSLog(@"点击---%ld",(long)indexPath.row);
   }
}
#pragma mark public

#pragma mark private

#pragma mark click Target

#pragma mark Add and Mansary

#pragma mark getter and setter
- (NSDictionary *)dateDic{
    if (_dateDic == nil) {
        _dateDic = [[NSDictionary alloc] init];
    }
    return _dateDic;
}

@end
