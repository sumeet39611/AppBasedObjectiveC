//
//  TADFoodDetailViewController.m
//  FoodDiary
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "TADFoodDetailViewController.h"
#import "TADFoodTableViewController.h"

@interface TADFoodDetailViewController ()

@end

@implementation TADFoodDetailViewController

@synthesize foodLabel,restaurantLabel,food;

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
    [foodLabel setText:[food objectForKey:kTADFoodName]];
    [restaurantLabel setText:[food objectForKey:kTADRestaurantName]];
    
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
