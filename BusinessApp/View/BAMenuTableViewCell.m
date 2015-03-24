//
//  BAMenuTableViewCell.m
//  BusinessApp
//
//  Created by Extremall on 14.02.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAMenuTableViewCell.h"
#import "AppHelper.h"
#import "RequestManager.h"

@interface BAMenuTableViewCell()

@property (nonatomic, strong) BAItem *item;

@end

@implementation BAMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fill:(BAItem *)item
{
    self.item = item;
    
    self.lblName.text = item.name;
    self.lblPrice.text = item.price;
    
    __block __weak BAItem *oldItem = item;
    
    [RequestManager  downloadImageAtURL:item.imageURL completion:^(UIImage *image, NSError *error) {
        if (oldItem.itemIDValue == self.item.itemIDValue)
        {
            self.imgPhoto.image = image;
        }
    }];
}

@end
