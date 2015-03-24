//
//  BAPhotoCollectionViewCell.m
//  BusinessApp
//
//  Created by Extremall on 24.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAPhotoCollectionViewCell.h"
#import "RequestManager.h"

@interface BAPhotoCollectionViewCell()

@property (nonatomic, strong) BAPhoto *photo;

@end

@implementation BAPhotoCollectionViewCell

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
