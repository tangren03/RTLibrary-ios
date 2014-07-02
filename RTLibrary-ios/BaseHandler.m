//
//  BaseHandler.m
//  zlydoc-iphone
//
//  Created by Ryan on 14-6-25.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "BaseHandler.h"
#import "APIConfig.h"

@implementation BaseHandler

+ (NSString *)requestUrlWithPath:(NSString *)path
{
    return [[@"http://" stringByAppendingString:[SERVER_HOST stringByAppendingString:API_VERSION]] stringByAppendingString:path];
}

@end
