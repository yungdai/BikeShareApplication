//
//  MapViewController.h
//  BikeShareApplication
//
//  Created by Yung Dai on 2015-05-04.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BikeShareLocation.h"
#import "BikeShareLocationManager.h"

// check to see if the iOS is 8.0 or higher
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface MapViewController : UITabBarController<MKMapViewDelegate, CLLocationManagerDelegate>


@property (nonatomic, strong) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) BikeShareLocationManager *bikeLocationManager;





@end
