//
//  BAYandexMapViewController.m
//  BusinessApp
//
//  Created by Extremall on 13.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAYandexMapViewController.h"

@interface YKAnnotation : NSObject <YMKDraggableAnnotation>

+ (id)pointAnnotation;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, assign) YMKMapCoordinate coordinate;

@end

@implementation YKAnnotation

+ (id)pointAnnotation {
    return [[[self class] alloc] init];
}

@end

@interface BAYandexMapViewController ()

@property (nonatomic, strong) YKAnnotation *annotation;

@end

@implementation BAYandexMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureMapView];
    [self configureAndInstallAnnotations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureMapView {
    self.mapView.showsUserLocation = NO;
    self.mapView.showTraffic = NO;
    [self.mapView setCenterCoordinate:YMKMapCoordinateMake(kLatitude, kLongitude)
                          atZoomLevel:16
                             animated:NO];
}

- (void)configureAndInstallAnnotations {
    self.annotation = [YKAnnotation pointAnnotation];
    self.annotation.coordinate = YMKMapCoordinateMake(kLatitude, kLongitude);
    self.annotation.title = @"Ван Гог";
    self.annotation.subtitle = @"Стендапы с ведущим Андреем Яковером";
    
    [self.mapView addAnnotation:self.annotation];
    self.mapView.selectedAnnotation = self.annotation;

}
@end
