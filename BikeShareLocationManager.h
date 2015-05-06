//
//  BikeShareLocationManager.h
//  BikeShareApplication
//
//  Created by Yung Dai on 2015-05-06.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPCommunication.h"
#import "BikeShareLocation.h"


@interface BikeShareLocationManager : NSObject

@property (strong, nonatomic) HTTPCommunication *http;

- (void)getBikeShareLocationsOnSucess:(void (^)(NSArray *locations))success;


@end
