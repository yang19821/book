//
//  mySqliteManage.h
//  notePod
//
//  Created by 刘阳 on 2021/3/3.
//

#import "FMDatabase.h"

NS_ASSUME_NONNULL_BEGIN

@interface mySqliteManage : FMDatabase
//初始化
+ (instancetype)sharedInstanceSqlite;
/**
 当前时间
 */
- (NSString *)getCurrentDate;
///**
// 结构体形式时间
// */
//- (NSDictionary *)getCurrentDateDictonary;
/**
 查询数据，string为sql查询语句，返回查询结果array
 */
- (NSArray *)sqliteGetDataWithString:(NSString *)string;
/**
 插入数据，三个字段分别为时间，数量和备注
 */
- (void)sqliteAddDataWithTime: (NSString *)time money:(NSString *)money note:(NSString *)note;
/**
 删除数据，传入要删除数据的key和value
 */
- (void)sqliteDeleteDataWithKey:(NSString *)key value:(NSString *)value;
/**
 改数据，未实现
 */
- (void)sqliteChangeDataWithString;
#pragma mark 数据库操作
/**
 返回一天的支出，收入和总和数据
 */
- (NSDictionary *)sqliteNumOfDay;
/**
 返回一周的支出，收入和总和数据
 */
- (NSDictionary *)sqliteNumOfWeek;
/**
 返回一月的支出，收入和总和数据
 */
- (NSDictionary *)sqliteNumOfMonth;
/**
 返回一年的支出，收入和总和数据
 */
- (NSDictionary *)sqliteNumOfYear;
@end

NS_ASSUME_NONNULL_END
