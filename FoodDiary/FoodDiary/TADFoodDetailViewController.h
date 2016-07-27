//
//  TADFoodDetailViewController.h
//  FoodDiary
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TADFoodDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *foodLabel;

@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;
@property (nonatomic,weak) NSDictionary *food;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
