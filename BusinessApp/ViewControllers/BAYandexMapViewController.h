//
//  BAYandexMapViewController.h
//  BusinessApp
//
//  Created by Extremall on 13.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BABaseViewController.h"
#import <YandexMapKit/YandexMapKit.h>

@interface BAYandexMapViewController : BABaseViewController

@property (nonatomic, weak) IBOutlet YMKMapView * mapView;

@end
