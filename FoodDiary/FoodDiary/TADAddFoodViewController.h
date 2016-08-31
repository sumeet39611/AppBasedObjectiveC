//
//  TADAddFoodViewController.h
//  FoodDiary
//
//  Creating interface TADAddFoodViewController
//
//  Created by Sumeet on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TADFoodTableViewController.h"

@interface TADAddFoodViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic,weak) TADFoodTableViewController *FoodTableViewController;

//outlet of UITextField for restaurant
@property (weak, nonatomic) IBOutlet UITextField *restaurantTextField;

//outlet of UITextField for food
@property (weak, nonatomic) IBOutlet UITextField *foodTextField;

//outlet of UISegmentedControl
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingControl;

//outlet of UILabel
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

//outlet of UIActivityIndicatorView
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

//action of button
- (IBAction)addFoodButtonPressed:(id)sender;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end
