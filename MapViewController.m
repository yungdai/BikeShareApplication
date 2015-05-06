//
//  MapViewController.m
//  BikeShareApplication
//
//  Created by Yung Dai on 2015-05-04.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import "MapViewController.h"



@interface MapViewController ()

@end

@implementation MapViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.bikeLocationManager = [[BikeShareLocationManager alloc]init];
    
    // start updating my location
    [self.locationManager startUpdatingLocation];
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    self.locationManager = [[CLLocationManager alloc]init];

    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
        
    }

    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
   
    
    // sets the view controller to be the delegate for the MapView
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];

    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.bikeLocationManager getBikeShareLocationsOnSucess:^(NSArray *locations) {
        for (BikeShareLocation *location in locations)
        {
            [self.mapView addAnnotation:location];
        }
    }];
}

@end
