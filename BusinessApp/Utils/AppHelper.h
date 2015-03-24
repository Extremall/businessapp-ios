//
//  AppHelper.h
//  GiveMeSign
//
//  Created by Alex Naurov on 23.04.14.
//  Copyright (c) 2014 GrowApp Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface AppHelper : NSObject


/*!
 * @discussion Email text validation method. Checks if symbols in email text are correct
 * @param candidate The email to be validated
 * @return Returns YES if email is correct, NO if not
 */
+ (BOOL)validateEmail:(NSString *)candidate;

/*!
 * @discussion Method using to round the UIView
 * @param aView UIView object that should become rounded
 * @param radius CGFloat number. For this number the radius of aView will become smaller (if use -radius - bigger)
 * @return CAShapeLayer, that should be assigned to aView.layer.mask
 */
+ (CAShapeLayer *)roundMaskByView:(UIView *)aView margin:(CGFloat)radius;

/*!
 * @discussion Method to convert NSDate object to NSString object with the certain format
 * @param date NSDate object to be converted
 * @param format NSString object that describes the format
 * @return Returns string representation of the UTC date
 */
+ (NSString *)utcStringFromDate:(NSDate *)date;

/*!
 * @discussion Method to convert NSDate object to NSString object with the certain format
 * @param date NSDate object to be converted
 * @param format NSString object that describes the format
 * @return Returns string representation of the date
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;

/*!
 * @discussion Method to convert NSDate object to NSString object. The string will have this format dd MMMM yyyy
 * @param date NSDate object to be converted
 * @return Returns string representation of the date
 */
+ (NSString *)stringFromDate:(NSDate *)date;

/*!
 * @discussion Method to convert NSDate object to NSString object. The string will have format like dd MMMM yyyy HH:mm
 * @param date NSDate object to be converted
 * @return Returns string representation of the date
 */
+ (NSString *)stringFromDateWithHours:(NSDate *)date;


/*!
 * @discussion Method to check if the Internet is available
 * @return Returns YES if the Internet is available, NO if not
 */
+ (BOOL)isInternetAvailable;

/*!
 * @discussion Method to delete all user data from the database
 */
+ (void)truncateAll;

+ (void)clearWebImageCache;

/*!
 * @discussion Method to format the phone number. It will set spaces and brackets
 * @param phone The phone number to be formated
 * @return Returns formated phone number
 */
+ (NSString *)formattedPhone:(NSString *)phone;

/*!
 * @discussion Method to filter phone number string with mask
 * @param string This is phone string, that should be filtered with mask
 * @return Returns phone string with filter mask
 */
NSMutableString *filteredPhoneStringFromStringWithFilter(NSString *string, NSString *filter);



@end
