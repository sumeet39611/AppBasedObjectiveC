//
//  TADFoodDetailViewController.m
//  FoodDiary
//
//  Showing up detail information of food like name,restaurant,rating and location
//
//  Created by Sumeet on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "TADFoodDetailViewController.h"
#import "TADFoodTableViewController.h"

@interface TADFoodDetailViewController ()

@end

@implementation TADFoodDetailViewController

@synthesize foodLabel,restaurantLabel,food,ratingLabel,mapView;

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
    
    //setting up food name
    [foodLabel setText:[food objectForKey:kTADFoodName]];
    
    //setting up restaurant name
    [restaurantLabel setText:[food objectForKey:kTADRestaurantName]];
 
    NSString *foodRating = [food objectForKey:kTADRating];
    NSString *foodRatingSentence= [[NSString alloc] initWithFormat:@"The Food is %@",foodRating];
    
    //setting up rating
    [ratingLabel setText:foodRatingSentence];
    
    NSNumber *latitude = [food objectForKey:kTADLatitude];
    NSNumber *longitude = [food objectForKey:kTADLongitude];
    MKCoordinateRegion region;
    region.span= MKCoordinateSpanMake(0.02, 0.02);
    region.center = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
    
    //setting mapview
    [mapView setRegion:region];
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
