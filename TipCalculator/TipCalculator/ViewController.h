//
//  ViewController.h
//  TipCalculator
//
//  Created by BridgeLabz on 22/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *Label;

@property (weak, nonatomic) IBOutlet UILabel *maxLabel;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISlider *Slider;

- (IBAction)sliderChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentTipLabel;

- (IBAction)buttonPressed:(id)sender;

@end

