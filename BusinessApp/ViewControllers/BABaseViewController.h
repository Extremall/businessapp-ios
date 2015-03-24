//
//  BABaseViewController.h
//  BusinessApp
//
//  Created by Extremall on 14.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "RequestManager.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <UIImageView+WebCache.h>

@interface BABaseViewController : UIViewController

+ (instancetype)create;

- (void)keyboardWillShow:(NSNotification *)notif;
- (void)keyboardDidShow:(NSNotification*)notif;

- (UIView *)findFirstResponderUnder:(UIView *)root;

@end
