//
//  tallyScrollView.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "tallyScrollView.h"

@implementation tallyScrollView


+ (tallyScrollView *)initTallyScrollView{
    tallyScrollView *scrollView = [[tallyScrollView alloc] init];
    scrollView.contentSize = CGSizeMake(2 *PM_w, 0);
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = UIColor.whiteColor;
    scrollView.showsHorizontalScrollIndicator = NO;
   
    return scrollView;
}


@end
