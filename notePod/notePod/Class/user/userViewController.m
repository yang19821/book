//
//  userNavViewController.m
//  notePod
//
//  Created by Choice on 2021/1/12.
//

#import "userViewController.h"

@interface userViewController ()

@end

@implementation userViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setColor];
    
}
- (void)setColor{
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
}
#pragma mark lifeCycle

#pragma mark UITableViewDelegate

#pragma mark customDelegate

#pragma mark eventResponse

#pragma mark privateMathods

#pragma mark getter and setter

@end
