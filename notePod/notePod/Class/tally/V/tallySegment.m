//
//  tallySegment.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "tallySegment.h"

@implementation tallySegment

+ (tallySegment *)initTallySegment{
    tallySegment *segment = [[tallySegment alloc] initWithItems:@[@"支出",@"收入"]];
    segment.selectedSegmentIndex = 0;
    segment.selectedSegmentTintColor = chengse;
    [segment setTitleTextAttributes:@{
            NSForegroundColorAttributeName:chengse,
            NSFontAttributeName:[UIFont systemFontOfSize:16],
    } forState:UIControlStateNormal];
    [segment setTitleTextAttributes:@{
        NSForegroundColorAttributeName:UIColor.whiteColor,
    } forState:UIControlStateSelected];
    segment.backgroundColor = UIColor.whiteColor;
    return segment;
}

@end
