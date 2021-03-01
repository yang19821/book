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
@interface homePageTableViewController ()

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
    if (indexPath.row == 1) {
        cell.title.text = @"本周";
    }
   else if (indexPath.row == 2) {
        cell.title.text = @"本月";
    }
   else if (indexPath.row == 3){
       cell.title.text = @"本年";
   }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        //跳转到图表对应界面
        NSLog(@"点击---%ld",(long)indexPath.row);
        
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


@end
