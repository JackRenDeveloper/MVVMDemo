//
//  NSString+NSString_AES256.h
//  ZHBWorker
//
//  Created by JackRen on 16/2/15.
//  Copyright © 2016年 atense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#import "NSData+NSData_AES256.h"

@interface NSString (NSString_AES256)

-(NSString *) aesStr256_encrypt:(NSString *)key;
-(NSString *) aesStr256_decrypt:(NSString *)key;

@end
