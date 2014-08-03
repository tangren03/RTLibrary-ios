//
//  LoginHandler.h
//  RTLibrary-ios
//
//  Created by Ryan on 14-8-3.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "BaseHandler.h"
#import "UserEntity.h"

@interface LoginHandler : BaseHandler

/**
 *  用户登录业务逻辑处理
 *
 *  @param user
 *  @param success
 *  @param failed  
 */
- (void)executeLoginTaskWithUser:(UserEntity *)user success:(SuccessBlock)success failed:(FailedBlock)failed;

@end
