//
//  tallyViewController.h
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import <UIKit/UIKit.h>
#import "tallySegment.h"
#import "tallyScrollView.h"
#import "tallyBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface tallyViewController : UIViewController

@property (nonatomic, strong) tallySegment *segment;
@property (nonatomic, strong) tallyScrollView *scrollView;

@end

NS_ASSUME_NONNULL_END
