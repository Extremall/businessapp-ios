//
//  BADetailDishViewController.h
//  BusinessApp
//
//  Created by Extremall on 28.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAItem.h"
#import "BABaseViewController.h"

@interface BADetailDishViewController : BABaseViewController

@property (nonatomic, weak) BAItem *item;

@property (nonatomic, weak) IBOutlet UILabel *lblTitle;
@property (nonatomic, weak) IBOutlet UIImageView *imgDish;

@end
