//
//  NSString+NSString_AES256.m
//  ZHBWorker
//
//  Created by JackRen on 16/2/15.
//  Copyright © 2016年 atense. All rights reserved.
//

#import "NSString+NSString_AES256.h"

@implementation NSString (NSString_AES256)



-(NSString *) aesStr256_encrypt:(NSString *)key
{
    int k =0;
    for (int i = 0; i < self.length; i++) {
        //        char k = [self characterAtIndex:i];
        NSString *temp = [self substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (3 == strlen(u8Temp)) {
            k++;
        }
    }
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];

    NSData *data = [NSData dataWithBytes:cstr length:self.length + 2*k];
    //对数据进行加密
    NSData *result = [data aes256_encrypt:key];
    
    //转换为2进制字符串
    if (result && result.length > 0) {
        
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return [output uppercaseString];
    }
    return nil;
}

-(NSString *) aesStr256_decrypt:(NSString *)key
{
    int k =0;
    for (int i = 0; i < self.length; i++) {
        //        char k = [self characterAtIndex:i];
        NSString *temp = [self substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (3 == strlen(u8Temp)) {
            k++;
        }
    }

    //转换为2进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / (2*(k+1))];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    
    //对数据进行解密
    NSData* result = [data aes256_decrypt:key];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}
@end
