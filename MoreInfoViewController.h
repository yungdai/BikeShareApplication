//
//  MoreInfoViewController.h
//  BikeShareApplication
//
//  Created by Yung Dai on 2015-05-05.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BikeShareLocation.h"

@interface MoreInfoViewController : UITabBarController
@property (strong, nonatomic) id<MKAnnotation> bikeStationData;
@property (strong, nonatomic) UILabel *moreInformationLabel;
@property (strong, nonatomic) NSString *string;


@end
