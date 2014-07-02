//
//  DBHelper.h
//  ZLYDoc
//  数据库管理
//  Created by Ryan on 14-4-14.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "BaseEntity.h"

//________________________________________________________
/**
 *  Database operate delegate
 */
@protocol DatabaseDelegate <NSObject>

@optional
- (BOOL)insert:(BaseEntity *)entity;
- (BOOL)update:(BaseEntity *)entity;
- (BOOL)remove:(BaseEntity *)entity;
- (BOOL)removeClientEntityWithId:(NSString *)id;
- (BaseEntity *)queryById:(NSString *) entityId;
- (NSMutableArray *)queryAll;
- (NSMutableArray *)queryAllOrderByName;
- (NSMutableArray *)queryAllOrderByTime;
- (void)closeDB;
- (BOOL)removeAll;

@required
- (void)createTable:(NSString *)sql;

@end
//________________________________________________________

@interface RTDatabaseHelper : NSObject

@property(nonatomic,strong) FMDatabase *database;

//管理类单例
+ (RTDatabaseHelper *)sharedInstance;

//获取数据库连接对象
- (FMDatabase *)openDatabase;

//删除所有表的数据
- (void)removeAllData;

//关闭数据库
- (void)closeDB;

//删除数据库文件
- (BOOL)deleteDatabase;

//判断指定表是否存在
- (BOOL)isTableExists:(NSString *)tableName;

@end
