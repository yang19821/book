//
//  tableHeaderView.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "tableHeaderView.h"

@implementation tableHeaderView

+ (UIView *)creatHeaderView{
    UIImage *headerImage = [UIImage imageNamed:@"2021"];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PM_w, 250)];
    view.backgroundColor = UIColor.greenColor;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, PM_w, 250)];
    imageView.image = headerImage;
    imageView.contentMode = UIViewContentModeScaleToFill;
    [view addSubview:imageView];
    return view;
}

@end
