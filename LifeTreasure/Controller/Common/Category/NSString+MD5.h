//
//  NSString+MD5.h
//  MD5_32
//
//  Created by andson-zhw on 17/3/1.
//  Copyright © 2017年 andson. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (MD5)
 /** md5 32 位加密，返回小写*/
+ (NSString*)md532BitLower:(NSString *)md5SourceStr;

 /** md5 32 位加密，返回大写*/
+ (NSString*)md532BitUpper:(NSString *)md5SourceStr;


/** md5 16 位加密，返回小写*/
+ (NSString *)MD5ForLower16Bate:(NSString *)md5SourceStr;

/** md5 16 位加密，返回大写*/
+ (NSString *)MD5ForUpper16Bate:(NSString *)md5SourceStr;

/** md5 32 位加密，返回小写*/
+ (NSString *)MD5ForLower32Bate:(NSString *)md5SourceStr;

/** md5 16 位加密，返回大写*/
+ (NSString *)MD5ForUpper32Bate:(NSString *)md5SourceStr;

@end
