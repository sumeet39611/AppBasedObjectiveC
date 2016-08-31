//
//  TADAddFoodViewController.m
//  FoodDiary
//
//  Taking food & restaurant name and added back to TADFoodTableViewController
//
//  Created by Sumeet on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "TADAddFoodViewController.h"

@interface TADAddFoodViewController ()

@end

@implementation TADAddFoodViewController

@synthesize foodTextField,FoodTableViewController,restaurantTextField,ratingControl;
@synthesize locationManager,activityIndicator,locationLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //setting up location manager
    if(locationManager == nil)
    {
        locationManager = [[CLLocationManager alloc]init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
        //[locationManager setPurpose:@"The location is used to save the restaurant location."];
    }
    
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    locationLabel.text = @"Updating Location......";
}

#pragma mark - location manager delegate methods
//when location is updated
-(void)locationManager: (CLLocationManager *) manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    [activityIndicator stopAnimating];
    locationLabel.text = @"location received";
}

//when location fails
-(void)locationManager: (CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
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
//on click of add button
- (IBAction)addFoodButtonPressed:(id)sender
{
    [locationManager stopUpdatingLocation];
    
    //getting food name
    NSString *newFoodName = [foodTextField text];
    
    //getting restaurant name
    NSString *newRestaurantName = [restaurantTextField text];
    NSString *rating = @"OK";
    
    //checking rating control with index
    if([ratingControl selectedSegmentIndex]== 0)
    {
        rating = @"Good";
    }
    else if([ratingControl selectedSegmentIndex] == 1)
    {
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
    
    //adding food and restaurant to the dictionary
    NSDictionary *newFood = [[NSDictionary alloc] initWithObjectsAndKeys:newFoodName,kTADFoodName,newRestaurantName, kTADRestaurantName, rating,kTADRating,longitudeNumber, kTADLongitude, latitudeNumber, kTADLatitude, nil];
    
    //adding food back to the TADFoodTableViewController
    [FoodTableViewController addFood:newFood ];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
