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
    scrollView.backgroundColor = UIColor.greenColor;
    scrollView.showsHorizontalScrollIndicator = YES;
    
    return scrollView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
