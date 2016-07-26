//
//  TADFoodTableViewController.h
//  FoodDiary
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTADFoodName @"FoodName"
#define kTADRestaurantName @"RestaurantName"
#define kTADRating @"Rating"

@interface TADFoodTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *foodArray;

-(void) addFood: (NSDictionary *) newFood;
-(void) saveData: (NSNotification *)notification;
@end
