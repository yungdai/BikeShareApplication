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
    
    
    // run the biklocation manager getBikeShareLocationOnSuccess method
    //    [self.bikeLocationManager getBikeShareLocationsOnSucess:^(NSArray *locations) {
    //
    //        for (BikeShareLocation *location in locations)
    //        {
    //
    //            [self.mapView addAnnotation:location];
    //        }
    //        
    //    }];
    
    
    // start updating my location
    
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    
    // user location setup
    self.locationManager = [[CLLocationManager alloc]init];


    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
        
    }
    
    self.locationManager.distanceFilter = kCLLocationAccuracyKilometer;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];



    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    
    


    
    // sets the view controller to be the delegate for the MapView
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];



}



// run this method when the user updates his information, plot down the bike locations onto the map

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {

    [self.bikeLocationManager getBikeShareLocationsOnSucess:^(NSArray *locations) {

        for (BikeShareLocation *location in locations)
        {
            
            [self.mapView addAnnotation:location];
        }

    }];
    
    
}

// method to zoom to the current user location
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id<MKAnnotation> mapPoint = [annotationView annotation];
    
    if (mapPoint == mapView.userLocation) {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mapPoint coordinate] ,700 , 700);
        [mapView setRegion:region animated:YES];
    }
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *bikeShareAnnotation = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
    
    if([annotation isKindOfClass:[BikeShareLocation class]]) {
        bikeShareAnnotation = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annoView"];
        
    }
    
    bikeShareAnnotation.image = [UIImage imageNamed:@"Bike_Share_Toronto_logo"];
    bikeShareAnnotation.frame = CGRectMake(0, 0, 45, 30);
    bikeShareAnnotation.canShowCallout = YES;
    
    return bikeShareAnnotation;
}


@end
