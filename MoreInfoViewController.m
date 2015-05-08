//
//  MoreInfoViewController.m
//  BikeShareApplication
//
//  Created by Yung Dai on 2015-05-05.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import "MoreInfoViewController.h"

@interface MoreInfoViewController ()

@end

@implementation MoreInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect top = self.view.bounds;
    self.moreInformationLabel = [[UILabel alloc]initWithFrame:CGRectInset(top, 0, 0)];
    self.moreInformationLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
    self.moreInformationLabel.textAlignment = NSTextAlignmentCenter;
    self.moreInformationLabel.text = [NSString stringWithFormat: @"Youre data: %@", self.string];
    
    
    [self.view addSubview:self.moreInformationLabel];
    
}



//- (NSString *)parseAnnotationObject:(id<MKAnnotation>)annotation {
//    
//    
//    /* NSMutableString *ingredientsText = [NSMutableString string];
//    for (NSString* ingredient in self.recipe.ingredients) {
//        [ingredientsText appendFormat:@"%@\n", ingredient];
//    }
//     */
//    
//    
//    NSMutableString *moreInfoText = [NSMutableString string];
//    
//    for (id<MKAnnotation> *bikeStationInfo in self.bikeStationData ){
//        [moreInfoText appendFormat:@"%@\n", bikeStationInfo];
//    }
//
//    return  moreInfoText;
//    
//}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    NSString *labelText = [[NSString alloc]init];
//    [labelText parseAnnotationObject:self.bikeStationData];

        self.moreInformationLabel.text = [NSString stringWithFormat: @"Youre data parsed: %@", self.bikeStationData];
//    self.moreInformationLabel.text = labelText;
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
