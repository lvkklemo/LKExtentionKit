//
//  NSDate+Custom.h
//  studyAbroad
//  日期工具类
//  Created by Darren on 2017/10/17.
//  Copyright © 2017年 环天下教育科技集团. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CustomDate)

// 当月最后一天
- (NSDate *)lastDayOfMonth;
// 当月有多少天
- (NSInteger)numberOfDaysInMonthCount;
// 当月有几周
- (NSInteger)numberOfWeekInMonthCount;
// 日期比较
- (NSDateComponents *)componentsOfDate;

// 日期转字符串 yyyy年mm月dd日
+ (NSString *)stringDayOfCustomDate:(NSDate *)date;
// yyyyMMddHHmmss 格式字符串
+ (NSString *)stringDayOfCurrentTimestamp;
// 字符串（@"yyyy-MM-dd HH:mm:ss zzz"）转日期
+ (NSDate *)convertDateFromString:(NSString *)dateString;
// 日期转字符串 yyyy-mm-dd
+ (NSString *)requestStringDayOfCustomDate:(NSDate *)date;
// 当前日期字符串
+ (NSString *)stringDayOfCurrentDate;
// 15年前的日期
+ (NSString *)stringDayOfFifteenYearsAgo;
// 15年后的日期
+ (NSString *)stringDayOfFifteenYearsLater;
// yyyy年mmdd日
+ (NSString *)stringDayOfDate:(NSDate *)date;
+ (NSString *)stringTimeOfDate:(NSDate *)date;
+ (NSString *)stringTimeOfNowDate:(NSDate *)date;
// 返回：yyyyMMdd格式字符串
+ (NSString *)stringDayOfDateNew:(NSDate *)date;
+ (NSString *)stringTimeTodayOfDate:(NSDate *)date;
+ (NSDateComponents *)componentsOfCurrentDate;
+ (NSDateComponents *)componentsOfDate:(NSDate *)date;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)dateWithHour:(NSInteger)hour min:(NSInteger)min;
+ (NSDateComponents *)componentsWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDateComponents *)componentsWithHour:(NSInteger)hour min:(NSInteger)min;
+ (BOOL)isTheSameDateTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB;
+ (BOOL)isTheSameTimeTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB;
+ (NSString *)stringActivityEventOfCurrentFullDate;
+ (NSString *)stringActivityEventOfCurrentHourAndMinute;

///-----------------------------------------
/// @name Calculating Beginning / End of Day
///-----------------------------------------

/**
 Returns a new date with first second of the day of the receiver.
 */
- (NSDate *)beginningOfDay;

/**
 Returns a new date with the last second of the day of the receiver.
 */
- (NSDate *)endOfDay;

///------------------------------------------
/// @name Calculating Beginning / End of Week
///------------------------------------------

/**
 Returns a new date with first second of the first weekday of the receiver, taking into account the current calendar's `firstWeekday` property.
 */
- (NSDate *)beginningOfWeek;

/**
 Returns a new date with last second of the last weekday of the receiver, taking into account the current calendar's `firstWeekday` property.
 */
- (NSDate *)endOfWeek;

///-------------------------------------------
/// @name Calculating Beginning / End of Month
///-------------------------------------------

/**
 Returns a new date with the first second of the first day of the month of the receiver.
 */
- (NSDate *)beginningOfMonth;

/**
 Returns a new date with the last second of the last day of the month of the receiver.
 */
- (NSDate *)endOfMonth;

///------------------------------------------
/// @name Calculating Beginning / End of Year
///------------------------------------------

/**
 Returns a new date with the first second of the first day of the year of the receiver.
 */
- (NSDate *)beginningOfYear;

- (NSDate *)beginOfYear;

/**
 Returns a new date with the last second of the last day of the year of the receiver.
 */
- (NSDate *)endOfYear;

// 获取当前日期（yyyy-MM-dd）
+ (NSDate *)currentDate;
/* 所选日期大于某个日期 */
+ (BOOL)SeceletDate:(NSString *)SeceltdateStr greaterLanDate:(NSString*)dateStr;
/* 将某个日期格式转换为另一个日期格式 */
+ (NSString *)ConverOneDateFormatStr:(NSString *)oneFormatStr FromAnotherDateFromatStr:(NSString *)anotherFormatStr Datestr:(NSString *)dateStr;
// 大于当前日期
+ (BOOL)greaterLanCurrentDate:(NSString *)dateStr;
// 小于当前日期
+ (BOOL)lessLanCurrentDate:(NSString *)dateStr;
// 将yyyy-MM-dd hh:mm:ss 格式的时间，转换成yyyy年MM月dd日格式
+ (NSString *)convertDateTime:(NSString *)dateStr;
// 将yyyy-MM-dd格式的时间，转换成yyyy年MM月dd日格式
+ (NSString *)convertNowDateTime:(NSString *)dateStr;
// 将yyyy-MM-dd hh:mm:ss 格式的时间，转换成yyyy/MM/dd格式
+ (NSString *)convertDateTimes:(NSString *)dateStr;
// 将yyyy-MM-dd hh:mm:ss转换yyyy-MM-dd格式
+ (NSString *)convertDateTimesToDay:(NSString *)dateStr;
// 将yyyy-MM-dd hh:mm:ss 格式的字符串时间，转换成NSTimeInterval
+ (NSTimeInterval)convertTimeInterval:(NSString *)dateStr;
// 将yyyy-MM-dd hh:mm:ss 格式的字符串时间，转换成NSDate
+ (NSDate *)convertDate:(NSString *)dateStr;
/** 将日期转化为周几的形式*/
+ (NSString *)convertDateIntoWeek:(NSString *)dateStr;
/** 将日期转化为周几的形式*/
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
// 将yyyy-MM-dd hh:mm:ss 格式的时间，转换成yyyy-MM-dd格式
+ (NSString *)convertDateTimeIntoNewTime:(NSString *)dateStr;
/** 转换为HH:mm类型*/
+ (NSString *)convertDateFromStrings:(NSString *)dateString;
// 将yyyy-MM-dd hh:mm:ss 格式的时间，转换成MM-dd hh:mm格式
+ (NSString *)convertDateFromCustomStr:(NSString *)dateStr;

@end
