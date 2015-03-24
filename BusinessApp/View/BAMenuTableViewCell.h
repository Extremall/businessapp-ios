//
//  BAMenuTableViewCell.h
//  BusinessApp
//
//  Created by Extremall on 14.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAItem.h"

@interface BAMenuTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *lblName;
@property (nonatomic, weak) IBOutlet UIImageView *imgPhoto;
@property (nonatomic, weak) IBOutlet UILabel *lblPrice;

- (void)fill:(BAItem *)item;

@end
