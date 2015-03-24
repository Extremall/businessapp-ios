//
//  BAAnnounceTableViewCell.m
//  BusinessApp
//
//  Created by Extremall on 12.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAAnnounceTableViewCell.h"
#import "RequestManager.h"

@interface BAAnnounceTableViewCell()

@property (nonatomic, strong) BAAnnounce *announce;

@end

@implementation BAAnnounceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fill:(BAAnnounce *)announce
{
    self.lblTitle.text = announce.title;
    self.announce = announce;
    
    __block __weak BAAnnounce *oldAnnounce = announce;
    
    [RequestManager downloadImageAtURL:announce.imageURL completion:^(UIImage *image, NSError *error) {
        if (oldAnnounce.announceIDValue == self.announce.announceIDValue)
        {
            self.imgPhoto.image = image;
        }
    }];
    
}

@end
