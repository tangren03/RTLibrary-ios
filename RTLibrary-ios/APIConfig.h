//
//  APIConfig.h
//  ZLYDoc
//  API信息
//  Created by Ryan on 14-4-14.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>

/***************SERVER HOST***************/

//#define SERVER_HOST @"192.168.1.99:3000"      //JQ测试机
//#define SERVER_HOST @"182.92.81.132:3000"     //阿里云测试机
#define SERVER_HOST @"182.92.81.107:3000"       //阿里云生产机
#define API_VERSION @"/api/v1"

/***************SERVER API***************/
//检测版本更新
#define API_CHECK_VERSION @"?pf=2"//FIXME
//登录
#define API_LOGIN @""
//意见反馈（Path: /api/v1/feedbacks）
#define API_POST_FEEDBACK @"/feedbacks"
//修改密码
#define API_MODIFY_PASSWORD @"/doctors/%@?action=chgpwd"
//TODO

@interface APIConfig : NSObject

@end