//
//  TADAddFoodViewController.m
//  FoodDiary
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "TADAddFoodViewController.h"

@interface TADAddFoodViewController ()

@end

@implementation TADAddFoodViewController

@synthesize foodTextField,FoodTableViewController,restaurantTextField,ratingControl;
@synthesize locationManager,activityIndicator,locationLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(locationManager == nil)
    {
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
  //  [locationManager setPurpose:@"The location is used to save the restaurant location."];
    }
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    
    locationLabel.text = @"Updating Location......";
    
}

#pragma mark - location manager delegate methods

-(void)locationManager: (CLLocationManager *) manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
    [activityIndicator stopAnimating];
    
    locationLabel.text = @"location received";
    
}


-(void)locationManager: (CLLocationManager *)manager didFailWithError:(nonnull NSError *)error{
    [activityIndicator stopAnimating];
    locationLabel.text = @"location error";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFoodButtonPressed:(id)sender {
    
    [locationManager stopUpdatingLocation];
    NSString *newFoodName = [foodTextField text];
    
    NSString *newRestaurantName = [restaurantTextField text];
    
    NSString *rating = @"OK";
    
    if([ratingControl selectedSegmentIndex]== 0){
        rating = @"Good";
    }else if([ratingControl selectedSegmentIndex] == 1){
        rating = @"Bad";
    }
        
    NSNumber *longitudeNumber = [NSNumber numberWithFloat: 0.0];
    NSNumber *latitudeNumber = [NSNumber numberWithFloat: 0.0];
    
    if(locationManager.location != nil)
    {
        CLLocationCoordinate2D currentCoordinate = locationManager.location.coordinate;
        longitudeNumber = [NSNumber numberWithFloat:currentCoordinate.longitude];
        latitudeNumber = [NSNumber numberWithFloat:currentCoordinate.latitude];
        
    
    }
    
    NSDictionary *newFood = [[NSDictionary alloc] initWithObjectsAndKeys:newFoodName,kTADFoodName,newRestaurantName, kTADRestaurantName, rating,kTADRating,longitudeNumber, kTADLongitude, latitudeNumber, kTADLatitude, nil];
    
    [FoodTableViewController addFood:newFood ];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}
@end
