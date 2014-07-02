//
//  BaseDao.m
//  ZLYDoc
//
//  Created by Ryan on 14-4-15.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import "BaseDao.h"
#import "FMDatabase.h"

@implementation BaseDao

-(void)createTable:(NSString *)sql
{
    FMDatabase *db = [[RTDatabaseHelper sharedInstance] openDatabase];
    if (![db executeUpdate:sql]) {
        DLog(@"Create table failed");
    }
    [db close];
}

@end
