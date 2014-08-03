//
//  LoginViewController.m
//  RTLibrary-ios
//
//  Created by Ryan on 14-8-3.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化LoginView，设置LoginViewDelegate处理登录视图的事件
    
    //在视图代理方法里通过调用LoginHandler处理登录业务逻辑，发起网络请求和结果处理均在LoginHandler中完成
}

@end
