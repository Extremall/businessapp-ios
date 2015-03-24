//
//  BAMapViewController.m
//  BusinessApp
//
//  Created by Extremall on 13.03.15.
//  Copyright (c) 2015 GrowApp Solutions. All rights reserved.
//

#import "BAMapViewController.h"

@interface Annotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coords;

@end

@implementation Annotation

- (CLLocationCoordinate2D)coordinate
{
    return self.coords;
}

- (NSString *)title
{
    return kName;
}

@end

@interface BAMapViewController ()

@end

@implementation BAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MKCoordinateRegion region;
    region.center = CLLocationCoordinate2DMake(kLatitude, kLongitude);
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    region.span = span;
    
    [_mapView setRegion:region];
    //_mapView.delegate = self;
    
    Annotation *an = [[Annotation alloc] init];
    an.coords = CLLocationCoordinate2DMake(kLatitude, kLongitude);
    [_mapView addAnnotation:an];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Map View Delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    else if ([annotation isKindOfClass:[Annotation class]]) // use whatever annotation class you used when creating the annotation
    {
        static NSString * const identifier = @"MyCustomAnnotation";
        
        MKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView)
        {
            annotationView.annotation = annotation;
        }
        else
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:identifier];
        }
        
        return annotationView;
    }
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
