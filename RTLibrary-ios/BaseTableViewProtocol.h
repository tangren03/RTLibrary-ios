//
//  UITableView通用代理协议
//  zlydoc-iphone
//  UITableView Protocol
//  Created by Ryan on 14-5-24.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>

//_________________________________________________________________________________________________________
//UITableViewCell操作代理协议
@protocol TableViewCellDelegate <NSObject>

@optional
/**
 *  点击或选中cell时的代理方法
 *
 *  @param indexPath
 */
- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  删除cell时的代理方法
 *
 *  @param indexPath 
 */
- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  根据返回值判断该cell是否可以被操作(移动、删除、插入等)
 *
 *  @return YES:Can NO:Cant
 */
- (BOOL)isCellEditable;

/**
 *  返回Cell高度的代理方法
 *
 *  @param indexPath
 *
 *  @return
 */
- (CGFloat)cellHeightAtIndexPath:(NSIndexPath *)indexPath;

@end
//_________________________________________________________________________________________________________
/**
 *  配置UITableViewCell展现方式的block
 *
 *  @param cell UITableViewCell及其子类
 *  @param entity Cell对应的实体
 *  @param indexPath
 */
typedef void (^TableViewCellConfigurate)(id cell, id entity, NSIndexPath *indexPath);

/**
 *  配置不同section中的cell的行数(rows)
 *
 *  @param section section下标
 *
 *  @return TableView中section的数量
 */
typedef NSInteger (^TableViewNumberOfRowsInSectionConfigurate) (NSInteger section);


/****************   TableViewProtocol   ****************/
@interface BaseTableViewProtocol : NSObject<UITableViewDataSource,UITableViewDelegate>

// UITableViewDelegate和UITableViewDatasource代理
@property (nonatomic,strong) id<TableViewCellDelegate> delegate;

/**
 *  协议构造器1：有多个section，每个section中cell行数不定时使用
 *
 *  @param aItems
 *  @param aCellIdentifier
 *  @param aSectionNumber                           section的数量
 *  @param aNunberOfRowsInSectionConfigureBlock     配置每个section中cell的行数
 *  @param aCellConfigureBlock                      配置每个cell的展现方式
 *
 *  @return Protocal Object
 */
-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
  numberOfSections:(NSInteger)aSectionNumber
numberOfRowsInSectionConfigureBlock:(TableViewNumberOfRowsInSectionConfigurate)aNunberOfRowsInSectionConfigureBlock
cellConfigureBlock:(TableViewCellConfigurate)aCellConfigureBlock;

/**
 *  协议构造器2：默认只有一个section时使用
 *
 *  @param aItems
 *  @param aCellIdentifier
 *  @param aCellConfigureBlock
 *
 *  @return Protocal Object
 */
-(id)initWithItems:(NSArray *)aItems
    cellIdentifier:(NSString *)aCellIdentifier
cellConfigureBlock:(TableViewCellConfigurate)aCellConfigureBlock;

@end
