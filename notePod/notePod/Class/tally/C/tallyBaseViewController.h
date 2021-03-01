//
//  zhichuViewController.h
//  notePod
//
//  Created by Choice on 2021/2/3.
//

#import <UIKit/UIKit.h>
#import "tallyBaseView.h"
NS_ASSUME_NONNULL_BEGIN

@interface tallyBaseViewController : UIViewController

@property (nonatomic, strong) tallyBaseView *baseView;

- (instancetype)initWithThemeColor: (UIColor *)color;

@end

NS_ASSUME_NONNULL_END
