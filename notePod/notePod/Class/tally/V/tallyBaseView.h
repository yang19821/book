//
//  tallyBaseView.h
//  notePod
//
//  Created by Choice on 2021/2/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface tallyBaseView : UIView

@property (nonatomic, strong) UITextField *inputNumField; //账单


+ (tallyBaseView *)initTallyBaseViewWithFrame: (CGRect)frame;

- (void)setColorWithThemeColor :(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
