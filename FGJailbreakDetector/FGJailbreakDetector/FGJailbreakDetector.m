//
//  FGJailbreakDetector.m
//  FGJailbreakDetector
//
//  Created by Feng Guo on 21/01/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGJailbreakDetector.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

NSString * const FGJailbreakSymbolicLinkPath = @"/Applications";
NSString * const FGJailbreakFilePath = @"/Library/MobileSubstrate/MobileSubstrate.dylib";

@implementation FGJailbreakDetector

+ (BOOL)hasJailbroken
{
#if TARGET_IPHONE_SIMULATOR
    return NO;
#else
    return [self hasEvidenceOfSymbolicLinking] ||
    [self hasSandboxIntegrityBeenCompromised] ||
    [self hasJailbreakFiles];
#endif
}

- (BOOL)hasJailbreakFiles
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:FGJailbreakFilePath]) {
        NSLog(@"Device Jailbroken due to the existence of jailbroken file - %@", FGJailbreakFilePath);
        return YES;
    }
    
    return NO;
}

- (BOOL)hasSandboxIntegrityBeenCompromised
{
    int result = fork();
    
    if (!result) exit(0);
    
    if (result >= 0) {
        NSLog(@"Device Jailbroken due sandbox integrity being compromised.");
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)hasEvidenceOfSymbolicLinking
{
    struct stat s;
    
    // code in jailbreak book is wrong lstat returns 0 on success
    if(lstat([FGJailbreakSymbolicLinkPath cStringUsingEncoding:NSUTF8StringEncoding], &s) == 0) {
        BOOL isSymbolicLink = (s.st_mode & S_IFLNK) == S_IFLNK;
        if(isSymbolicLink) {
            NSLog(@"Device Jailbroken due to evidence of symbolic linking at - %@", FGJailbreakSymbolicLinkPath);
            return YES;
        }
    }
    
    return NO;
}

@end
