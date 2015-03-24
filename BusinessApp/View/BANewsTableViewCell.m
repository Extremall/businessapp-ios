//
//  BANewsTableViewCell.m
//  BusinessApp
//
//  Created by Extremall on 11.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BANewsTableViewCell.h"

@implementation BANewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fill:(BANews *)news
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd MMMM yyyy";
    self.lblTitle.text = news.title;
    self.lblDate.text = [formatter stringFromDate:news.date];
}

@end
