//
//  NSDate+Custom.m
//  studyAbroad
//
//  Created by Darren on 2017/10/17.
//  Copyright © 2017年 环天下教育科技集团. All rights reserved.
//

#import "NSDate+CustomDate.h"

#if (defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000) || (defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && __MAC_OS_X_VERSION_MAX_ALLOWED >= 1090)
#define CYCalendarUnitYear NSCalendarUnitYear
#define CYCalendarUnitMonth NSCalendarUnitMonth
#define CYCalendarUnitWeek NSCalendarUnitWeekOfYear
#define CYCalendarUnitDay NSCalendarUnitDay
#define CYCalendarUnitHour NSCalendarUnitHour
#define CYCalendarUnitMinute NSCalendarUnitMinute
#define CYCalendarUnitSecond NSCalendarUnitSecond
#define CYCalendarUnitWeekday NSCalendarUnitWeekday
#define CYDateComponentUndefined NSDateComponentUndefined
#else
#define CYCalendarUnitYear NSYearCalendarUnit
#define CYCalendarUnitMonth NSMonthCalendarUnit
#define CYCalendarUnitWeek NSWeekOfYearCalendarUnit
#define CYCalendarUnitDay NSDayCalendarUnit
#define CYCalendarUnitHour NSHourCalendarUnit
#define CYCalendarUnitMinute NSMinuteCalendarUnit
#define CYCalendarUnitSecond NSSecondCalendarUnit
#define CYCalendarUnitWeekday NSWeekdayCalendarUnit
#define CYDateComponentUndefined NSUndefinedDateComponent
#endif

@implementation NSDate (CustomDate)

-(NSDate*)lastDayOfMonth {
    
    NSInteger dayCount = [self numberOfDaysInMonthCount];
    
    NSCalendar *calendar;
#ifdef __IPHONE_8_0
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSDateComponents *comp;
#ifdef __IPHONE_8_0
    comp = [calendar components:
            NSCalendarUnitYear |
            NSCalendarUnitMonth |
            NSCalendarUnitDay fromDate:self];
#else
    comp = [calendar components:
            NSYearCalendarUnit |
            NSMonthCalendarUnit |
            NSDayCalendarUnit fromDate:self];
#endif
    
    [comp setDay:dayCount];
    
    return [calendar dateFromComponents:comp];
}

-(NSInteger)numberOfDaysInMonthCount {
    
    NSCalendar *calendar;
#ifdef __IPHONE_8_0
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSRange dayRange;
#ifdef __IPHONE_8_0
    dayRange = [calendar rangeOfUnit:NSCalendarUnitDay
                              inUnit:NSCalendarUnitMonth
                             forDate:self];
#else
    dayRange = [calendar rangeOfUnit:NSDayCalendarUnit
                              inUnit:NSMonthCalendarUnit
                             forDate:self];
#endif
    
    
    return dayRange.length;
}

- (NSInteger)numberOfWeekInMonthCount {
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    NSRange weekRange;
#ifdef __IPHONE_8_0
    weekRange = [calender rangeOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitMonth forDate:self];
#else
    weekRange = [calender rangeOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
#endif
    return weekRange.length;
}


- (NSDateComponents *)componentsOfDate{
    
#ifdef __IPHONE_8_0
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | NSCalendarUnitHour |
            NSCalendarUnitMinute fromDate:self];
#else
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | NSHourCalendarUnit |
            NSMinuteCalendarUnit fromDate:self];
#endif
    
}

#pragma mark - Methods Statics

+ (NSDateComponents *)componentsOfCurrentDate {
    
    return [NSDate componentsOfDate:[NSDate date]];
}

+ (NSDateComponents *)componentsOfDate:(NSDate *)date {
    
#ifdef __IPHONE_8_0
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth| NSCalendarUnitHour |
            NSCalendarUnitMinute fromDate:date];
#else
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth| NSHourCalendarUnit |
            NSMinuteCalendarUnit fromDate:date];
#endif
    
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    
    NSCalendar *calendar;
#ifdef __IPHONE_8_0
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *components = [NSDate componentsWithYear:year month:month day:day];
    
    return [calendar dateFromComponents:components];
}

+ (NSDate *)dateWithHour:(NSInteger)hour min:(NSInteger)min {
    
    NSCalendar *calendar;
#ifdef __IPHONE_8_0
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *components = [NSDate componentsWithHour:hour min:min];
    
    return [calendar dateFromComponents:components];
}

+ (NSString *)stringTimeOfDate:(NSDate *)date {
    
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    [dateFormater setDateFormat:@"aa HH:mm"];
    
    return [dateFormater stringFromDate:date];
}

+ (NSString *)stringTimeOfNowDate:(NSDate *)date {
    
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    [dateFormater setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormater stringFromDate:date];
}

+ (NSString *)stringDayOfDateNew:(NSDate *)date {
    
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    [dateFormater setDateFormat:@"yyyyMMdd"];
    
    return [dateFormater stringFromDate:date];
}

+ (NSString *)stringTimeTodayOfDate:(NSDate *)date {
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    [dateFormater setDateFormat:@"HH:mm"];
    
    return [dateFormater stringFromDate:date];
}

+ (NSString *)stringDayOfCustomDate:(NSDate *)date {
    
    NSDateComponents *comp = [NSDate componentsOfDate:date];
    
    return [NSString stringWithFormat:@"%ld年%d月%d日",(long)comp.year,(int)comp.month,(int)comp.day];
    
}

+ (NSString *)stringDayOfCurrentTimestamp {
    return [[self dateFormatter:@"yyyyMMddHHmmss"] stringFromDate:[NSDate date]];
}

+ (NSDate *)convertDateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    NSDate *destDate = [dateFormatter dateFromString:dateString];
    
    return destDate;
    
}

+ (NSString *)requestStringDayOfCustomDate:(NSDate *)date {
    
    NSDateComponents *comp = [NSDate componentsOfDate:date];
    
    return [NSString stringWithFormat:@"%ld-%ld-%ld",(long)comp.year,(long)comp.month,(long)comp.day];
    
}

+ (NSString *)stringDayOfCurrentDate {
    
    NSDateComponents *comp = [NSDate componentsOfDate:[NSDate date]];
    
    return [NSString stringWithFormat:@"%ld-%d-%d",(long)comp.year,(int)comp.month,(int)comp.day];
    
}



+ (NSString *)stringActivityEventOfCurrentFullDate {
    
    NSDateComponents *comp = [NSDate componentsOfDate:[NSDate date]];
    
    return [NSString stringWithFormat:@"%d年%d月%d日  %d:%d",(int)comp.year,(int)comp.month,(int)comp.day,(int)comp.hour,(int)comp.minute];
    
}

+ (NSString *)stringActivityEventOfCurrentHourAndMinute {
    
    NSDateComponents *comp = [NSDate componentsOfDate:[NSDate date]];
    
    return [NSString stringWithFormat:@"%d:%d",(int)comp.hour,(int)comp.minute];
    
}


+ (NSString *)stringDayOfFifteenYearsAgo {
    
    NSDateComponents *comp = [NSDate componentsOfDate:[NSDate date]];
    
    return [NSString stringWithFormat:@"%d-%d-%i",(int)comp.year-15,(int)comp.month,1];
    
}
+ (NSString *)stringDayOfFifteenYearsLater {
    
    NSDateComponents *comp = [NSDate componentsOfDate:[NSDate date]];
    
    return [NSString stringWithFormat:@"%d-%d-%i",(int)comp.year+15,(int)comp.month,1];
    
}


+ (NSString *)stringDayOfDate:(NSDate *)date {
    
    NSDateComponents *comp = [NSDate componentsOfDate:date];
    
    NSString *monthName = nil;
    NSString *weekName = nil;
    
    switch (comp.weekday) {
            case 1:
            weekName = @"周日";
            break;
            case 2:
            weekName = @"周一";
            break;
            case 3:
            weekName = @"周二";
            break;
            case 4:
            weekName = @"周三";
            break;
            case 5:
            weekName = @"周四";
            break;
            case 6:
            weekName = @"周五";
            break;
            case 7:
            weekName = @"周六";
            break;
        default:
            weekName = @"";
            break;
            
    }
    
    switch (comp.month) {
            case 1:
            monthName = @"01月";
            break;
            case 2:
            monthName = @"02月";
            break;
            case 3:
            monthName = @"03月";
            break;
            case 4:
            monthName = @"04月";
            break;
            case 5:
            monthName = @"05月";
            break;
            case 6:
            monthName = @"06月";
            break;
            case 7:
            monthName = @"07月";
            break;
            case 8:
            monthName = @"08月";
            break;
            case 9:
            monthName = @"09月";
            break;
            case 10:
            monthName = @"10月";
            break;
            case 11:
            monthName = @"11月";
            break;
            case 12:
            monthName = @"12月";
            break;
        default:
            monthName = @"";
            break;
    }
    
    return [NSString stringWithFormat:@"%d年%@%d日 %@",(int)comp.year,monthName,(int)comp.day,weekName];
    
}

+ (NSDateComponents *)componentsWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    return components;
}

+ (NSDateComponents *)componentsWithHour:(NSInteger)hour min:(NSInteger)min {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setHour:hour];
    [components setMinute:min];
    
    return components;
}

+ (BOOL)isTheSameDateTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB {
    
    return ([compA day]==[compB day] && [compA month]==[compB month ]&& [compA year]==[compB year]);
}

+ (BOOL)isTheSameTimeTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB {
    
    return ([compA hour]==[compB hour] && [compA minute]==[compB minute]);
}


- (NSDate *)beginningOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth | CYCalendarUnitDay fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfDay] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth | CYCalendarUnitWeekday | CYCalendarUnitDay fromDate:self];
    
    NSInteger offset = components.weekday - (NSInteger)calendar.firstWeekday;
    components.day = components.day - offset;
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekOfMonth = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfWeek] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfMonth] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)beginOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = -2;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfYear] options:0] dateByAddingTimeInterval:0];
}

- (NSDate *)endOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 3;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfYear] options:0] dateByAddingTimeInterval:-1];
}

+ (NSDate *)currentDate{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    int daySeconds = 24 * 60 * 60;
    NSInteger allDays = interval / daySeconds;
    return [NSDate dateWithTimeIntervalSince1970:allDays * daySeconds];
}
/* 所选日期大于某个日期 例如L:大于2019年后的日期*/
+ (BOOL)SeceletDate:(NSString *)SeceltdateStr greaterLanDate:(NSString*)dateStr{
    
    NSDate *selectdate = [[self dateFormatter:@"yyyyMM"] dateFromString:SeceltdateStr];
    NSDate *date = [[self dateFormatter:@"yyyyMM"] dateFromString:dateStr];
    NSInteger selectSeconds = [selectdate timeIntervalSince1970];
    NSInteger dateSeconds = [date timeIntervalSince1970];
    if (selectSeconds >= dateSeconds) {
        return YES;
    } else {
        return NO;
    }
    return YES;
}
+ (BOOL)greaterLanCurrentDate:(NSString *)dateStr{
    NSDate *now = [self currentDate];
    NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
    NSInteger nowSeconds = [now timeIntervalSince1970];
    NSInteger dateSeconds = [date timeIntervalSince1970];
    if (dateSeconds > nowSeconds) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)lessLanCurrentDate:(NSString *)dateStr{
    NSDate *now = [self currentDate];
    NSDate *date = [[self dateFormatter:@"yyyy-MM-dd"] dateFromString:dateStr];
    NSInteger nowSeconds = [now timeIntervalSince1970];
    NSInteger dateSeconds = [date timeIntervalSince1970];
    if (dateSeconds <= nowSeconds) {
        return YES;
    } else {
        return NO;
    }
    return YES;
}

+ (NSString *)convertDateTime:(NSString *)dateStr{
    if (dateStr != nil && ![dateStr isEqualToString:@""]){
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return [[self dateFormatter:@"yyyy年MM月dd日"] stringFromDate:date];
    } else {
        return @"";
    }
}

+ (NSString *)convertNowDateTime:(NSString *)dateStr {
    if (dateStr != nil && ![dateStr isEqualToString:@""]){
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd"] dateFromString:dateStr];
        return [[self dateFormatter:@"yyyy年MM月dd日"] stringFromDate:date];
    } else {
        return @"";
    }
}

+ (NSString *)convertDateTimes:(NSString *)dateStr{
    if (dateStr != nil && ![dateStr isEqualToString:@""]){
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return [[self dateFormatter:@"yyyy/MM/dd"] stringFromDate:date];
    } else {
        return @"";
    }
}

+ (NSString *)convertDateTimesToDay:(NSString *)dateStr{
    if (dateStr != nil && ![dateStr isEqualToString:@""]){
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return [[self dateFormatter:@"yyyy-MM-dd"] stringFromDate:date];
    } else {
        return @"";
    }
}

+ (NSTimeInterval)convertTimeInterval:(NSString *)dateStr{
    if (dateStr != nil && ![dateStr isEqualToString:@""]) {
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return [date timeIntervalSince1970];
    } else {
        return 0;
    }
}

+ (NSDate *)convertDate:(NSString *)dateStr{
    if (dateStr != nil && ![dateStr isEqualToString:@""]) {
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return date;
    } else {
        return nil;
    }
}

+ (NSString *)convertDateIntoWeek:(NSString *)dateStr {
    if (dateStr != nil && ![dateStr isEqualToString:@""]) {
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return [self weekdayStringFromDate:date];
    } else {
        return nil;
    }
}

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

+ (NSString *)convertDateTimeIntoNewTime:(NSString *)dateStr{
    if (dateStr != nil && ![dateStr isEqualToString:@""]){
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return [[self dateFormatter:@"yyyy-MM-dd"] stringFromDate:date];
    } else {
        return @"";
    }
}

/** 转换为HH:mm类型*/
+ (NSString *)convertDateFromStrings:(NSString *)dateString {
    
    NSDate *inputDate = [NSDate convertDate:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *str = [dateFormatter stringFromDate:inputDate];
    
    return str;
    
}
/* 将某个日期格式转换为另一个日期格式 */
+ (NSString *)ConverOneDateFormatStr:(NSString *)oneFormatStr FromAnotherDateFromatStr:(NSString *)anotherFormatStr Datestr:(NSString *)dateStr{
    
    if (dateStr != nil && ![dateStr isEqualToString:@""]){
        NSDate *date = [[self dateFormatter:oneFormatStr] dateFromString:dateStr];
        return [[self dateFormatter:anotherFormatStr] stringFromDate:date];
    } else {
        return @"";
    }
}

+ (NSString *)convertDateFromCustomStr:(NSString *)dateStr
{
    if (dateStr != nil && ![dateStr isEqualToString:@""]){
        NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:dateStr];
        return [[self dateFormatter:@"MM-dd HH:mm"] stringFromDate:date];
    } else {
        return @"";
    }
}

+ (NSDateFormatter *)dateFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return dateFormatter;
}

@end
