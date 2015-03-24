//
//  BAMapViewController.h
//  BusinessApp
//
//  Created by Extremall on 13.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BABaseViewController.h"
#import <MapKit/MapKit.h>

@interface BAMapViewController : BABaseViewController<MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end
