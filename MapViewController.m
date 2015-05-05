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
    
    //initialise http
    _http = [[HTTPCommunication alloc]init];
    
    // Do any additional setup after loading the view.
    
    // find your current location
    self.locationManager = [[CLLocationManager alloc]init];
    // look to myself for the CLLocationManager Delegate
    self.locationManager.delegate = self;

    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
        
    }
    // start updating my location
    [self.locationManager startUpdatingLocation];
    // initalise the Map View Object
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.frame];

    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    
    // sets the view controller to be the delegate for the MapView
    self.mapView.delegate = self;

    // initalise the Map View Object

    

    // display the map in the subview
    [self.view addSubview:self.mapView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
