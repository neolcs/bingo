//
//  NSData+Hash.m
//  CommonUtility
//
//  Created by Chuan Li on 1/2/01.
//  Copyright (c) 2001 Mountain King. All rights reserved.
//

#import "NSData+Hash.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSData (Hash)

- (NSString *)MD5{
    CC_MD5_CTX ctx;
    uint8_t* hashBytes = NULL;
    hashBytes = malloc(CC_MD5_DIGEST_LENGTH*sizeof(uint8_t));
    memset(hashBytes, 0, CC_MD5_DIGEST_LENGTH);
    
    CC_MD5_Init(&ctx);
    CC_MD5_Update(&ctx, [self bytes], [self length]);
    CC_MD5_Final(hashBytes, &ctx);
    
    NSMutableString* hashString = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        NSString* frag = [NSString stringWithFormat:@"%02x", hashBytes[i]];
        [hashString appendString:frag];
    }
    free(hashBytes);
    return hashString;
}

@end
