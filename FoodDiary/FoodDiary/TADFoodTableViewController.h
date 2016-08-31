//
//  TADFoodTableViewController.h
//  FoodDiary
//
//  Creating interface TADFoodTableViewContrller
//
//  Created by Sumeet on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTADFoodName @"FoodName"
#define kTADRestaurantName @"RestaurantName"
#define kTADRating @"Rating"
#define kTADLongitude @"Longitude"
#define kTADLatitude @"Latitude"


@interface TADFoodTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *foodArray;

-(void) addFood: (NSDictionary *) newFood;
-(void) saveData: (NSNotification *)notification;

@end
