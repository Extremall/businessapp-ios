//
//  NSString+Format.h
//  GiveMeSign
//
//  Created by Alex Naurov on 24.04.14.
//  Copyright (c) 2014 GrowApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Format)

+ (NSString *)emptyIfNull:(NSString *)str;
+ (NSString *)trimAndEmptyIfNull:(NSString *)str;
- (NSString *)stripNotNumericSymbols;

@end
