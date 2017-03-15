//
//  NSString+MD5.m
//  MD5_32
//
//  Created by andson-zhw on 17/3/1.
//  Copyright © 2017年 andson. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

#pragma mark - /** md5 32 位加密，返回小写*/
+ (NSString*)md532BitLower:(NSString *)md5SourceStr
{
    const char *cStr = [md5SourceStr UTF8String];
    unsigned char result[16];
    
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

#pragma mark - /** md5 32 位加密，返回大写*/
+ (NSString*)md532BitUpper:(NSString *)md5SourceStr
{
    const char *cStr = [md5SourceStr UTF8String];
    unsigned char result[16];
    
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}


#pragma mark - /** md5 16 位加密，返回小写*/
+ (NSString *)MD5ForLower16Bate:(NSString *)md5SourceStr
{
    NSString *md5Str = [self MD5ForLower32Bate:md5SourceStr];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

#pragma mark - /** md5 16 位加密，返回大写*/
+ (NSString *)MD5ForUpper16Bate:(NSString *)md5SourceStr
{
    NSString *md5Str = [self MD5ForUpper32Bate:md5SourceStr];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

#pragma mark - /** md5 32 位加密，返回小写*/
+ (NSString *)MD5ForLower32Bate:(NSString *)md5SourceStr
{
    //要进行UTF8的转码
    const char* input = [md5SourceStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

#pragma mark - /** md5 16 位加密，返回大写*/
+ (NSString *)MD5ForUpper32Bate:(NSString *)md5SourceStr
{
    //要进行UTF8的转码
    const char* input = [md5SourceStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}
@end
