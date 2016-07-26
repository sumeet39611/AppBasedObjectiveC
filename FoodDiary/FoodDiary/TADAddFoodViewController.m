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

@synthesize foodTextField,FoodTableViewController,restaurantTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)addFoodButtonPressed:(id)sender {
    
    NSString *newFoodName = [foodTextField text];
    
    NSString *newRestaurantName = [restaurantTextField text];
    
    NSDictionary *newFood = [[NSDictionary alloc] initWithObjectsAndKeys:newFoodName,kTADFoodName,newRestaurantName, kTADRestaurantName, nil];
    
    [FoodTableViewController addFood:newFood ];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}
@end
