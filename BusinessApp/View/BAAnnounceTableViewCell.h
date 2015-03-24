//
//  BAAnnounceTableViewCell.h
//  BusinessApp
//
//  Created by Extremall on 12.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAAnnounce.h"

@interface BAAnnounceTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imgPhoto;
@property (nonatomic, weak) IBOutlet UILabel *lblTitle;

- (void)fill:(BAAnnounce *)announce;

@end
