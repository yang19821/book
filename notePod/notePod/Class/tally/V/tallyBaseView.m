//
//  tallyBaseView.m
//  notePod
//
//  Created by Choice on 2021/2/3.
//

#import "tallyBaseView.h"

@interface tallyBaseView ()<UITextViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UIView *lineView; //账单下方的线
@property (nonatomic, strong) UILabel *yuanLabel; //账单后方的元
@property (nonatomic, strong) UIColor *themeColor; //主题颜色
@property (nonatomic, strong) UIImageView *bookImageView; //备注图标
@property (nonatomic, strong) UITextView *noteTextView; //备注输入框

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
    [self addSubview:self.bookImageView];
    [self addSubview:self.noteTextView];
    
    self.noteTextView.delegate = self;
    self.inputNumField.delegate = self;
    
    [self setMasonry];
}
#pragma mark public
- (void)setColorWithThemeColor:(UIColor *)color{
    self.themeColor = color;
    [self reloadInputViews];
}
#pragma mark delegate of textView
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text  isEqual: @"备注"]) {
        textView.text = @"";
        textView.textColor = UIColor.blackColor;
    }
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    else
        return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        textView = nil;
    }
}

#pragma mark delegate of textfield



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
    [self.bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(30);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(30);
    }];
    [self.noteTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(30);
        make.left.mas_equalTo(self.bookImageView.mas_right).offset(30);
        make.right.mas_equalTo(self.mas_right).offset(-30);
        make.height.mas_equalTo(400);
    }];
    
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
- (UIColor *)themeColor{
    if (!_themeColor) {
        _themeColor = guGreen;
    }
    return _themeColor;
}
- (UIImageView *)bookImageView{
    if (!_bookImageView) {
        _bookImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beizhu"]];
    }
    return _bookImageView;
}
- (UITextView *)noteTextView{
    if (!_noteTextView) {
        _noteTextView = [[UITextView alloc] init];
        _noteTextView.textColor = [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:1];
        _noteTextView.backgroundColor = UIColor.whiteColor;
        _noteTextView.font = [UIFont systemFontOfSize:25];
        _noteTextView.text = @"备注";
        
    }
    return _noteTextView;
}
@end
