//
//  BAPhotoTableViewCell.m
//  BusinessApp
//
//  Created by Extremall on 24.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAPhotoTableViewCell.h"
#import "RequestManager.h"

@interface BAPhotoTableViewCell()

@property (nonatomic, strong) BAPhoto *photo;

@end

@implementation BAPhotoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fill:(BAPhoto *)photo
{
    self.photo = photo;
    _lblDesc.text = photo.desc;
    
    __weak __block BAPhoto *oldPhoto = photo;
    
    [RequestManager downloadImageAtURL:photo.url completion:^(UIImage *image, NSError *error) {
        if (oldPhoto.photoIDValue == self.photo.photoIDValue)
        {
            self.imgPhoto.image = image;
        }
    }];
}

@end
