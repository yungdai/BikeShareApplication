//
//  BikeShareLocations.m
//  BikeShareApplication
//
//  Created by Yung Dai on 2015-05-05.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import "BikeShareLocations.h"


@implementation BikeShareLocations
- (instancetype)init
{
    self = [super init];
    if (self) {
        //initialise http
        _http = [[HTTPCommunication alloc]init];
        _bikeLocations = [[NSDictionary alloc]init];
    }
    return self;
}

- (void)storeBikeShareLocations {
    // retrieve the joke using HTTP communication
    NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    [_http retrieve:url successBlock:^(NSData * response) {
        NSError *error  = nil;
        // deserialise the information we get from the API
        _bikeLocations = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSLog(@"%@", response);
        NSLog(@"%@", _bikeLocations);
        
        
        if (!error) {
            NSDictionary *value = _bikeLocations[@"stationBean"];
            if (value && value[@"stationName"]) {
                _responseID = value[@"id"];
                [_stationName setText:value["@stationName"]];
                
            }
        }
        
    }];
}


@end
