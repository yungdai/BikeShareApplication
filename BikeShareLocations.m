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
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
//        NSLog(@"%@", response);
//        NSLog(@"%@", data);
        
        // fast enumeration to put my data into the arrays
        if (!error) {
            NSArray *stationBeans = [data valueForKey:@"stationBeanList"];
            _stationName = [[NSMutableArray alloc]init];
            _latitude = [[NSMutableArray alloc]init];
            _longitude = [[NSMutableArray alloc]init];
            _stationID = [[NSMutableArray alloc]init];
            _availableBikes = [[NSMutableArray alloc]init];
            for (NSDictionary *results in stationBeans) {
                [_stationName addObject:[results objectForKey:@"stationName"]];
                [_latitude addObject:[results objectForKey:@"latitude"]];
                [_longitude addObject:[results objectForKey:@"longitude"]];
                [_stationID addObject:[results objectForKey:@"id"]];
                [_availableBikes addObject:[results objectForKey:@"availableBikes"]];

                
            }
                                         
        }
    }];
}

@end
     
