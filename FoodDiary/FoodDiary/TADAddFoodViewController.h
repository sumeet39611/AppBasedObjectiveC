//
//  TADAddFoodViewController.h
//  FoodDiary
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TADFoodTableViewController.h"

@interface TADAddFoodViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic,weak) TADFoodTableViewController *FoodTableViewController;
@property (weak, nonatomic) IBOutlet UITextField *restaurantTextField;
@property (weak, nonatomic) IBOutlet UITextField *foodTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingControl;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)addFoodButtonPressed:(id)sender;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end
