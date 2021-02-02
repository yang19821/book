//
//  homePageTableViewCell.m
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import "homePageTableViewCell.h"
@implementation homePageTableViewCell

+ (homePageTableViewCell *)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    homePageTableViewCell *cell = [[homePageTableViewCell alloc] init];
    
    cell.backgroundColor = UIColor.whiteColor;
    UIImageView *backgroudImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell"]];
    cell.backgroundView = backgroudImage;
    [cell drawRectCell];
    return cell;
}

- (homePageTableViewCell *)drawRectCell{
    [self addSubview:self.titleImageView];
    [self addSubview:self.title];
    [self addSubview:self.income];
    [self addSubview:self.spending];
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(20);
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(32);
        make.width.mas_equalTo(200);
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(45);
    }];
    [_income mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(50);
        make.right.mas_equalTo(self.mas_right).offset(-40);
        make.top.mas_equalTo(20);
    }];
    [_spending mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(-40);
        make.width.mas_equalTo(50);
        make.bottom.mas_equalTo(-20);
    }];
    return self;
}
#pragma mark getter add setter
- (UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc] init];
        _title.text = @"今天";
        _title.textColor = chengse;
        _title.textAlignment = NSTextAlignmentLeft;
        _title.font = [UIFont systemFontOfSize:20];
    }
    return _title;
}
- (UILabel *)income{
    if (_income == nil) {
        _income = [[UILabel alloc] init];
        _income.text = @"+0.00";//收入
        _income.textColor = UIColor.greenColor;
        _income.textAlignment = NSTextAlignmentRight;
        _income.font = [UIFont systemFontOfSize:16];
    }
    return _income;
}
- (UILabel *)spending{
    if (_spending == nil) {
        _spending = [[UILabel alloc] init];
        _spending.text = @"-0.00";//支出
        _spending.textColor = UIColor.redColor;
        _spending.textAlignment = NSTextAlignmentRight;
        _spending.font = [UIFont systemFontOfSize:16];
    }
    return _spending;
}
- (UIImageView *)titleImageView{
    if (_titleImageView == nil) {
        _titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loacationicon"]];
    }
    return _titleImageView;
}
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end