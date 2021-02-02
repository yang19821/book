//
//  homePageTableViewCell.h
//  notePod
//
//  Created by Choice on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface homePageTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UILabel *income; //收入
@property (nonatomic, strong) UILabel *spending; //支出

+ (homePageTableViewCell *)initWithReuseIdentifier: (NSString *)reuseIdentifier;


@end

NS_ASSUME_NONNULL_END
