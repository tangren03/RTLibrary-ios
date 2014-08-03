//
//  LoginStorage.m
//  RTLibrary-ios
//
//  Created by Ryan on 14-8-3.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "LoginStorage.h"
#import "UserDefaultsUtils.h"

static NSString * const USER_NAME = @"username";

@implementation LoginStorage

+ (void)saveUserName:(NSString *)userName
{
    [UserDefaultsUtils saveValue:userName forKey:USER_NAME];
}

+ (NSString *)userName
{
    return [UserDefaultsUtils valueWithKey:USER_NAME];
}

@end
