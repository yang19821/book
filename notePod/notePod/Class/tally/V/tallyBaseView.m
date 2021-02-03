//
//  tallyBaseView.m
//  notePod
//
//  Created by Choice on 2021/2/3.
//

#import "tallyBaseView.h"

@interface tallyBaseView ()

@property (nonatomic, strong) UIView *lineView; //账单下方的线
@property (nonatomic, strong) UILabel *yuanLabel; //账单后方的元
@property (nonatomic, strong) UIColor *themeColor; //主题颜色

@end

@implementation tallyBaseView

+ (tallyBaseView *)initTallyBaseViewWithFrame:(CGRect)frame{
    
    tallyBaseView *view = [[tallyBaseView alloc] initWithFrame:frame];
    
    return view;
}
- (void)layoutSubviews{
    [self addSubview:self.inputNumField];
    [self addSubview:self.lineView];
    [self addSubview:self.yuanLabel];
    
    [self setMasonry];
}
#pragma mark masonry
- (void)setMasonry{
    [self.inputNumField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(300);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.top.mas_equalTo(self.mas_top).offset(50);
    }];
    [self.yuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.bottom.mas_equalTo(self.inputNumField.mas_bottom);
        make.right.mas_equalTo(-20);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(2);
        make.width.mas_equalTo(PM_w-20);
        make.top.mas_equalTo(self.inputNumField.mas_bottom).offset(20);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
}
#pragma mark public
- (void)setColorWithThemeColor:(UIColor *)color{
    self.themeColor = color;
    [self reloadInputViews];
}
#pragma mark getter and setter
- (UIView *)lineView{
    if(!_lineView){
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = self.themeColor;
    }
    return _lineView;
}
- (UITextField *)inputNumField{
    if (_inputNumField == nil) {
        _inputNumField = [[UITextField alloc] init];
        _inputNumField.backgroundColor = UIColor.clearColor;
        _inputNumField.textColor = self.themeColor;
        _inputNumField.font = [UIFont systemFontOfSize:90];
        _inputNumField.placeholder = @"0.00";
        _inputNumField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _inputNumField;
}
- (UILabel *)yuanLabel{
    if (!_yuanLabel) {
        _yuanLabel = [[UILabel alloc] init];
        _yuanLabel.text = @"¥";
        _yuanLabel.textColor = self.themeColor;
        _yuanLabel.font = [UIFont systemFontOfSize:50];
    }
    return _yuanLabel;
}
-(UIColor *)themeColor{
    if (!_themeColor) {
        _themeColor = guGreen;
    }
    return _themeColor;
}
@end
