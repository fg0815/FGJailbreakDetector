//
//  FGJailbreakDetector.h
//  FGJailbreakDetector
//
//  Created by Feng Guo on 21/01/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGJailbreakDetector : NSObject

/**
 *  Check if the device has been jailbroken
 *
 *  - Simulator is not detectable
 *  - Check if Cydia is existed
 *  - Check if your application is running from inside a restricted sandbox
 *  - Using the `lstat` function to check if '/Applications' folder is actually a directory or just a symbolic link. A symbolic link means the device has been jailbroken.
 *
 *  @return YES if device has been jailbroken, otherwise NO
 */
+ (BOOL)hasJailbroken;

@end
