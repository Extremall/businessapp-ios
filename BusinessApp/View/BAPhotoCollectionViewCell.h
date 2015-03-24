//
//  BAPhotoCollectionViewCell.h
//  BusinessApp
//
//  Created by Extremall on 24.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAPhoto.h"

@interface BAPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imgPhoto;
@property (nonatomic, weak) IBOutlet UILabel *lblDesc;

- (void)fill:(BAPhoto *)photo;

@end
