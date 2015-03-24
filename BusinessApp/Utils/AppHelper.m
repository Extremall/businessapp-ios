//
//  AppHelper.m
//  GiveMeSign
//
//  Created by Alex Naurov on 23.04.14.
//  Copyright (c) 2014 GrowApp Solutions. All rights reserved.
//

#import "AppHelper.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>
#import "Constants.h"
#import "Reachability.h"
#import "NSString+Format.h"

@implementation AppHelper

+ (NSArray *)appTourImages
{
    return @[
             [UIImage imageNamed:@"1.png"],
             [UIImage imageNamed:@"2.png"],
             [UIImage imageNamed:@"3.png"],
             [UIImage imageNamed:@"4.png"],
             [UIImage imageNamed:@"5.png"],
             [UIImage imageNamed:@"6.png"],
             [UIImage imageNamed:@"7.png"],
             [UIImage imageNamed:@"8.png"]
             ];
}

+ (BOOL)validateEmail:(NSString *)candidate
{
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	return [emailTest evaluateWithObject:candidate];
}



+ (NSString *)formattedPhone:(NSString *)phone
{
    phone = [phone stripNotNumericSymbols];
    phone = [@"+" stringByAppendingString:phone];
    phone = [phone stringByReplacingCharactersInRange:NSMakeRange(2, 0) withString:@" ("];
    phone = [phone stringByReplacingCharactersInRange:NSMakeRange(7, 0) withString:@") "];
    phone = [phone stringByReplacingCharactersInRange:NSMakeRange(12, 0) withString:@"-"];
    phone = [phone stringByReplacingCharactersInRange:NSMakeRange(15, 0) withString:@"-"];
    return phone;
}


+ (CAShapeLayer *)roundMaskByView:(UIView *)aView margin:(CGFloat)radius
{
    CGSize size = aView.frame.size;
    
    //Creating path for clipping
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //Clipping
    [path addArcWithCenter:CGPointMake(size.width / 2, size.height / 2)
                    radius:(MIN(size.width, size.height) / 2) - radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [path CGPath];
    
    return maskLayer;
}

+ (NSString *)utcStringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString * deviceLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:deviceLanguage];
    
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    [dateFormatter setLocale:locale];
    
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString * deviceLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:deviceLanguage];
    
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:locale];
    
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    return [AppHelper stringFromDate:date withFormat:@"dd MMMM yyyy"];
}

+ (NSString *)stringFromDateWithHours:(NSDate *)date
{
    return [AppHelper stringFromDate:date withFormat:@"dd MMMM yyyy HH:mm"];
}

+ (void)downloadImageWithUrl:(NSString *)urlString withCompletion:(void(^)(id image))completion
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[SDWebImageManager sharedManager] downloadWithURL:url
                                               options:0
                                              progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                  
                                              } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished) {
                                                  if (error != nil)
                                                      return;
                                                  completion(image);
                                              }];
}

#pragma mark - Truncate DB

+ (void)truncateAll
{
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

#pragma mark - Clear SDWebImage cache

+ (void)clearWebImageCache
{
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    [imageCache clearMemory];
    [imageCache clearDisk];
}

#pragma mark - Check Internet Method

+ (BOOL)isInternetAvailable
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if (status == NotReachable)
        return NO;
    else
        return YES;
}

#pragma mark -

NSMutableString *filteredPhoneStringFromStringWithFilter(NSString *string, NSString *filter)
{
    NSUInteger onOriginal = 0, onFilter = 0, onOutput = 0;
    char outputString[([filter length])];
    BOOL done = NO;
    
    while(onFilter < [filter length] && !done)
    {
        char filterChar = [filter characterAtIndex:onFilter];
        char originalChar = onOriginal >= string.length ? '\0' : [string characterAtIndex:onOriginal];
        switch (filterChar) {
            case '#':
                if(originalChar=='\0')
                {
                    // We have no more input numbers for the filter.  We're done.
                    done = YES;
                    break;
                }
                if(isdigit(originalChar))
                {
                    outputString[onOutput] = originalChar;
                    onOriginal++;
                    onFilter++;
                    onOutput++;
                }
                else
                {
                    onOriginal++;
                }
                break;
            default:
                // Any other character will automatically be inserted for the user as they type (spaces, - etc..) or deleted as they delete if there are more numbers to come.
                outputString[onOutput] = filterChar;
                onOutput++;
                onFilter++;
                if(originalChar == filterChar)
                    onOriginal++;
                break;
        }
    }
    outputString[onOutput] = '\0'; // Cap the output string
    return [[NSString stringWithUTF8String:outputString] mutableCopy];
}


+ (UIImage *)imgWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(CGSizeMake(1, 64));
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, 1, 64));
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
