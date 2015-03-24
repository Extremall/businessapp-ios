//
//  BADetailedNewsViewController.h
//  BusinessApp
//
//  Created by Extremall on 11.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BABaseViewController.h"
#import "BANews.h"

@interface BADetailedNewsViewController : BABaseViewController

@property (nonatomic, strong) BANews *news;

@property (nonatomic, weak) IBOutlet UILabel *lblTitle;
@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end
