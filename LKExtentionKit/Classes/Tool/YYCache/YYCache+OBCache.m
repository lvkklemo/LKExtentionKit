//
//  YYCache+OBCache.m
//  HQStudent
//
//  Created by 积剩 on 2019/2/26.
//  Copyright © 2019 环天下教育科技集团. All rights reserved.
//

#import "YYCache+OBCache.h"

#define kGEDU_QRViewTag @"qrViewTag"
#define kGEDU_YYCACHEDBNAME @"StudentDB"//存储的数据库名字
#define kGEDU_NEWSPAGENAME @"NewsPapersName"

#define kGEDU_YYCACHESchoolMateDB @"SchoolMateDB"//存储的数据库名字
#define kGEDU_SchoolMateNAME @"SchoolMateName"

//@implementation YYCache (OBCache)
//
////报班数据存储
//+ (BOOL)setNewspapersOfCache:(NSArray *)newspapersArray
//{
//    YYCache *cache = [self cacheWithName:kGEDU_YYCACHEDBNAME];
//    [cache setObject:newspapersArray forKey:kGEDU_NEWSPAGENAME];
//    return YES;
//}
////报班数据获取
//+ (NSMutableArray *)NewspapersOfCache
//{
//    YYCache *cache = [self cacheWithName:kGEDU_YYCACHEDBNAME];
//    return (NSMutableArray *)[cache objectForKey:kGEDU_NEWSPAGENAME];
//}
//
/////同学列表存储
//+ (BOOL)setSchoolMateOfCache:(NSArray *)schoolMates{
//    YYCache *cache = [self cacheWithName:kGEDU_YYCACHESchoolMateDB];
//    [cache setObject:schoolMates forKey:kGEDU_SchoolMateNAME];
//    return YES;
//}
////同学列表获取
//+ (NSMutableArray *)schoolMateOfCache{
//    YYCache *cache = [self cacheWithName:kGEDU_YYCACHESchoolMateDB];
//    return (NSMutableArray *)[cache objectForKey:kGEDU_SchoolMateNAME];
//}
////同学列表删除
//+ (void)removeSchoolMateOfCache{
//    YYCache *cache = [self cacheWithName:kGEDU_YYCACHESchoolMateDB];
//    [cache removeObjectForKey:kGEDU_SchoolMateNAME];
//}
//
////打卡页面保存
//+ (BOOL)setCurrentViewName:(NSString *)pageName{
//    [[NSUserDefaults standardUserDefaults] setObject:pageName forKey:kGEDU_QRViewTag];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    return YES;
//}
//
//+ (NSString *)currentViewName {
//    NSString *loginName = [[NSUserDefaults standardUserDefaults] objectForKey:kGEDU_QRViewTag];
//    return loginName;
//}
//
//@end
