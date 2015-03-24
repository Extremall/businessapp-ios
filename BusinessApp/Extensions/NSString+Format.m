//
//  NSString+Format.m
//  GiveMeSign
//
//  Created by Alex Naurov on 24.04.14.
//  Copyright (c) 2014 GrowApp Solutions. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)

+ (NSString *)emptyIfNull:(NSString *)str
{
    if (str == nil || [str isKindOfClass:[NSNull class]])
        return @"";
    else
        return str;
}

+ (NSString *)trimAndEmptyIfNull:(NSString *)str
{
    if (str == nil)
        return @"";
    else
        return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stripNotNumericSymbols
{
    NSString *res = [[self componentsSeparatedByCharactersInSet:
                      [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                     componentsJoinedByString:@""];
    return res;
}

@end
