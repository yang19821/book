//
//  tallySegment.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "tallySegment.h"

@implementation tallySegment

+ (tallySegment *)initTallySegment{
    NSArray *items = [NSArray arrayWithObjects:@"支出",@"收入", nil];
    tallySegment *segment = [[tallySegment alloc] initWithItems:items];
    segment.selectedSegmentIndex = 0;
    segment.tintColor = chengse;
//    segment.backgroundColor = UIColor.redColor;
    return segment;
}

@end
