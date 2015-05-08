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
{
    NSDictionary *mapLaunchOptions;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // sety the default mapping launch option as walking instead of driving
        mapLaunchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking};
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.bikeLocationManager = [[BikeShareLocationManager alloc]init];
    
    // draw the map view onto the the screen
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    //NOTE should look into constraing for this view when I draw it
    
    
    // user location setup
    self.locationManager = [[CLLocationManager alloc]init];

    // make sure that the user is using iOS 8 or later
    
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
        
    }
    
    self.locationManager.distanceFilter = kCLLocationAccuracyKilometer;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    //  plot the location of all the bikeShareLocations
    [self.bikeLocationManager getBikeShareLocationsOnSucess:^(NSArray *locations) {
        
        for (BikeShareLocation *location in locations)
        {
            
            [self.mapView addAnnotation:location];
        }
        
    }];
    
    [self.locationManager startUpdatingLocation];



    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    
    


    
    // sets the view controller to be the delegate for the MapView
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];

    
}





// when I tap the callout accessory I launch the maps app for that location
// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    id <MKAnnotation> annotation = view.annotation;
    CLLocationCoordinate2D coordinate = [annotation coordinate];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *mapitem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapitem.name = annotation.title;
    
    
    if (control == view.rightCalloutAccessoryView) {
    
        MoreInfoViewController *moreInfoViewController = self.tabBarController.viewControllers[1];
        
        moreInfoViewController.bikeStationData = annotation;
        moreInfoViewController.string = annotation.title;

        
        [self.tabBarController setSelectedIndex:1];
        

        
    } 

}

// method to zoom to the current user location
/* Tells the delegate that one or more annotation views were added to the map.
 By the time this method is called, the specified views are already added to the map
 */
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id<MKAnnotation> mapPoint = [annotationView annotation];
    
    if (mapPoint == mapView.userLocation) {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mapPoint coordinate] ,700 , 700);
        [mapView setRegion:region animated:YES];
    }
}



// method to set custom annotation images
// Tells the delegate that one or more annotation views were added to the map.
// By the time this method is called, the specified views are already added to the map.
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *bikeShareAnnotation = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
    
    if([annotation isKindOfClass:[BikeShareLocation class]])
    {
        if (bikeShareAnnotation == nil)
        {
            bikeShareAnnotation = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annoView"];
            
            
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bike_Share_Toronto_logo"]];
            iconView.frame = CGRectMake(0, 0, 45, 30);
            
            bikeShareAnnotation.leftCalloutAccessoryView = iconView;
            
            
            bikeShareAnnotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            bikeShareAnnotation.canShowCallout = YES;
            // Add an image to the left callout.
            
            bikeShareAnnotation.image = [UIImage imageNamed:@"Bike_Share_Toronto_logo"];
            bikeShareAnnotation.frame = CGRectMake(0, 0, 45, 30);
            
            
            
            UITapGestureRecognizer *tapReg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnImageView:)];
            [iconView addGestureRecognizer:tapReg];
            iconView.userInteractionEnabled = YES;
        }
    }
    
    // on the right of my Callout display a UIButton
   
    return bikeShareAnnotation;
}

- (void)didTapOnImageView:(id)sender
{
    id <MKAnnotation> annotation = [self.mapView selectedAnnotations][0];
    CLLocationCoordinate2D coordinate = [annotation coordinate];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *mapitem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapitem.name = annotation.title;
    [mapitem openInMapsWithLaunchOptions:mapLaunchOptions];
}

// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.



@end
