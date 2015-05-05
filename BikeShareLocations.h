//
//  BikeShareLocations.h
//  BikeShareApplication
//
//  Created by Yung Dai on 2015-05-05.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPCommunication.h"

@interface BikeShareLocations : NSObject

@property (strong, nonatomic) NSDictionary *bikeLocations;
@property (strong, nonatomic) NSMutableArray *availableBikes;
@property (strong, nonatomic) NSMutableArray *latitude;
@property (strong, nonatomic) NSMutableArray *longitude;
@property (strong, nonatomic) NSMutableArray *stationName;
@property (strong, nonatomic) NSMutableArray *stationID;
@property (strong, nonatomic) NSMutableArray *availableDocks;
@property (strong, nonatomic) NSMutableArray *totalDocks;

@property (strong, nonatomic) HTTPCommunication *http;
@property (strong, nonatomic) NSNumber *responseID;

- (void)storeBikeShareLocations;

@end
