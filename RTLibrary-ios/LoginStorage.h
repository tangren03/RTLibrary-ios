//
//  LoginStorage.h
//  RTLibrary-ios
//
//  Created by Ryan on 14-8-3.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginStorage : NSObject

/**
 *  获取登录用户名
 *
 *  @return
 */
+ (NSString *)userName;

/**
 *  保存登录用户名
 *
 *  @param userName
 */
+ (void)saveUserName:(NSString *)userName;

@end
