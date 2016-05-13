//
//  NSData+NSData_AES256.h
//  ZHBWorker
//
//  Created by JackRen on 16/2/15.
//  Copyright © 2016年 atense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (NSData_AES256)
-(NSData *) aes256_encrypt:(NSString *)key;
-(NSData *) aes256_decrypt:(NSString *)key;
@end
