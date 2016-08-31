//
//  TADFoodDetailViewController.h
//  FoodDiary
//
//  Creating interface TADFoodDetailViewController
//
//  Created by Sumeet on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TADFoodDetailViewController : UIViewController

//outlet of UILabel for food
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;

//outlet of UILabel for restaurant
@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;

@property (nonatomic,weak) NSDictionary *food;

//outlet of UILabel for rating
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

//outlet of MKMapView
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
