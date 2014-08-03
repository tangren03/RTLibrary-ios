//
//  AppUtils.m
//  zlydoc+iphone
//
//  Created by Ryan on 14+5+23.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "AppUtils.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <CommonCrypto/CommonDigest.h>

#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@implementation AppUtils

/********************* System Utils **********************/
+ (void)showAlertMessage:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:msg message:nil delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
    [alertView show];
}

+ (void)closeKeyboard
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

+ (NSString *)md5FromString:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/******* UITableView & UINavigationController Utils *******/
+ (UILabel *)tableViewsHeaderLabelWithMessage:(NSString *)message
{
    UILabel *lb_headTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 20)];
    lb_headTitle.font = [UIFont boldSystemFontOfSize:15.0];
    lb_headTitle.textColor = [UIColor darkGrayColor];
    lb_headTitle.textAlignment = NSTextAlignmentCenter;
    lb_headTitle.text = message;
    return lb_headTitle;
}

+ (UIView *)tableViewsFooterView
{
    UIView *coverView = [UIView new];
    coverView.backgroundColor = [UIColor clearColor];
    return coverView;
}

+ (UIBarButtonItem *)navigationBackButtonWithNoTitle
{
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

/********************* SVProgressHUD **********************/
+ (void)showSuccessMessage:(NSString *)message
{
    [SVProgressHUD showSuccessWithStatus:message];
}

+ (void)showErrorMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
}

+ (void)showProgressMessage:(NSString *) message
{
    [SVProgressHUD showWithStatus:message];
}

+ (void)dismissHUD
{
    [SVProgressHUD dismiss];
}

/********************** NSDate Utils ***********************/
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:dateString];
}

/********************* Category Utils **********************/
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

/********************* Verification Utils **********************/
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber{
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:phoneNumber];
    BOOL res2 = [regextestcm evaluateWithObject:phoneNumber];
    BOOL res3 = [regextestcu evaluateWithObject:phoneNumber];
    BOOL res4 = [regextestct evaluateWithObject:phoneNumber];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
