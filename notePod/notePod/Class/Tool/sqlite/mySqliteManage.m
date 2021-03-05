//
//  mySqliteManage.m
//  notePod
//
//  Created by 刘阳 on 2021/3/3.
//

#import "mySqliteManage.h"
@interface mySqliteManage ()

@property (nonatomic, copy) NSString *timeNow;

@end

@implementation mySqliteManage{
    FMDatabase *db;
}


static id _instance;
static id dbPath;
#pragma mark init
+ (instancetype)sharedInstanceSqlite{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSArray *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
       NSString *dbDir = [dirPath objectAtIndex:0];
       dbPath = [dbDir stringByAppendingPathComponent:@"riji.sqlite"];
        _instance = [[self alloc] init];
    });
    return _instance;
}
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
#pragma mark public
- (void)sqliteAddDataWithTime:(NSString *)time money:(NSString *)money note:(NSString *)note{
    [self openSqlite];
    [self creatTable];
    //插入操作
    BOOL result_db = [db executeUpdateWithFormat:@"insert into moneyNote (date, money, note) values (%@,%@,%@)",time,money,note];
    if (result_db) {
                NSLog(@"插入成功");
            } else {
                NSLog(@"插入失败");
            }
    [self closeSqlite];
}
- (NSArray *)sqliteGetDataWithString:(NSString *)string{
    [self openSqlite];
     FMResultSet *resultSet = [db executeQuery:string];
    NSMutableArray *dataArr = [NSMutableArray array];
    while ([resultSet next]) {
        NSString *date = [resultSet objectForColumn:@"date"];
        NSString *money = [resultSet objectForColumn:@"money"];
        NSString *note = [resultSet objectForColumn:@"note"];
        NSDictionary *dic = @{
            @"date":date,
            @"money":money,
            @"note":note
        };
        [dataArr addObject:dic];
    }
    [self closeSqlite];
    NSArray *arr = [NSArray arrayWithArray:dataArr];
    return arr;
}
- (void)sqliteDeleteDataWithKey:(NSString *)key value:(NSString *)value{
    NSString *sqlStr = [NSString stringWithFormat:@"delete from 'moneyNote' where %@ = %@",key,value];
    [self openSqlite];
   BOOL result = [db executeUpdate:sqlStr];
    if (result) {
        NSLog(@"删除成功");
    }
    else {
        NSLog(@"删除失败");
    }
    [self closeSqlite];
}
- (void)sqliteChangeDataWithString{
    
}
- (NSString *)getCurrentDate{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];//样式
    NSString *time_now = [formatter stringFromDate:date];
    NSLog(@"格式化后的时间%@", time_now);
    return time_now;
}

#pragma mark private
- (void)openSqlite{
    if (db == nil) {
        db = [FMDatabase databaseWithPath:dbPath];
    }
    //打开数据库
    if ([db open]) {
        
    } else {
        NSLog(@"打开数据库失败");
    }
}
- (void)closeSqlite{
    if ([db close]) {
    } else {
        NSLog(@"关闭数据库失败");
    }
}
- (void)creatTable{
    //创建表
    BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS moneyNote (date Datetime PRIMARY KEY, money text NOT NULL, note text NOT NULL);"];
    if (result) {
        NSLog(@"创建表成功");
    } else {
        NSLog(@"创建表失败");
    }
}
- (NSNumber *)numberAdd:(NSNumber *)value_1 :(NSNumber *)value_2{
    value_1 = [NSNumber numberWithInt: [value_1 intValue] + [value_2 intValue]];
    return value_1;
}
- (NSDictionary *)resultsSetOfString:(NSString *)string{
    
    int expendNum = 0;
    int incomeNum = 0;
    //1.数据库查询数据
    [self openSqlite];
    FMResultSet *resultSet = [db executeQuery:string];
    if (resultSet) {
        //求和
       while ([resultSet next]) {
        int moneyNum = [resultSet intForColumn:@"money"];
            if (moneyNum >0) {
                incomeNum += moneyNum;
            }
            else if (moneyNum <0){
                expendNum += moneyNum;
            }
        }
    }
    else {
        NSLog(@"没有数据");
    }
    [self closeSqlite];
    NSDictionary *dataDic = @{
        @"incomeNum":[NSString stringWithFormat:@"+%d",incomeNum],
        @"expendNum":[NSString stringWithFormat:@"%d",expendNum]
    };
    return dataDic;
}
#pragma mark 数据库求和
- (NSDictionary *)sqliteNumOfDay{
    //today
    NSString *sqliteString = [NSString stringWithFormat:@"select *from moneyNote where date between '%@ 00:00:00' and '%@ 23:59:59'",self.timeNow,self.timeNow];
    NSDictionary *dic = [self resultsSetOfString:sqliteString];
    return dic;
}
- (NSDictionary *)sqliteNumOfWeek{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取当前星期
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear fromDate:date];
    int weekday = (int)[components weekday] - 1;
    if (weekday == 0) {
        weekday = 7;
    }
    int firstDay = weekday-1;
    //获取周一的数据
    [components setDay:[components day] - firstDay];
    NSDate *firstDate = [calendar dateFromComponents:components];
    NSString *firstString = [self getTimeStringWithDate:firstDate];
    //获取周日的数据
    [components setDay:[components day] +6];
    NSDate *lastDate = [calendar dateFromComponents:components];
    NSString *lastString = [self getTimeStringWithDate:lastDate];
    //读取数据库
    NSString *sqlString = [NSString stringWithFormat:@"select *from moneyNote where date between '%@ 00:00:00' and '%@ 23:59:59'",firstString,lastString];
    NSDictionary *dic = [self resultsSetOfString:sqlString];
    return dic;
}
- (NSDictionary *)sqliteNumOfMonth{
    //month
    NSString *sqlString = [self.timeNow substringToIndex:7];
    sqlString = [NSString stringWithFormat:@"select *from moneyNote where date between '%@-01 00:00:00' and '%@-31 23:59:59'",sqlString,sqlString];
    NSDictionary *dic = [self resultsSetOfString:sqlString];
    return dic;
}
- (NSDictionary *)sqliteNumOfYear{
    //year
    NSString *sqlString = [self.timeNow substringToIndex:4];
    sqlString = [NSString stringWithFormat:@"select *from moneyNote where date between '%@-01-01 00:00:00' and '%@-12-31 23:59:59'",sqlString,sqlString];
    NSDictionary *dic = [self resultsSetOfString:sqlString];
    return dic;
}
#pragma mark getter and setter
- (NSString *)timeNow{
    if (!_timeNow) {
        _timeNow = [[self getCurrentDate] substringToIndex:10];
    }
    return _timeNow;
}
#pragma mark 工具方法
//获取当前时间日期星期
- (NSString *)getTimeStringWithDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *time = [formatter stringFromDate:date];
    return time;
}
@end
