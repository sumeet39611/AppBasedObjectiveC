//
//  TADAddFoodViewController.h
//  FoodDiary
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TADFoodTableViewController.h"

@interface TADAddFoodViewController : UIViewController

@property (nonatomic,weak) TADFoodTableViewController *FoodTableViewController;
@property (weak, nonatomic) IBOutlet UITextField *restaurantTextField;
@property (weak, nonatomic) IBOutlet UITextField *foodTextField;

- (IBAction)addFoodButtonPressed:(id)sender;


@end
