//
//  BADetailedAnnounceViewController.h
//  BusinessApp
//
//  Created by Extremall on 12.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAAnnounce.h"
#import "BABaseViewController.h"

@interface BADetailedAnnounceViewController : BABaseViewController

@property (nonatomic, strong) BAAnnounce *announce;

@property (nonatomic, weak) IBOutlet UIImageView *imgPhoto;
@property (nonatomic, weak) IBOutlet UILabel *lblTitle;
@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end
