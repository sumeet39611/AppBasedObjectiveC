//
//  ViewController.h
//  TipCalculator
//
//  Creating interface
//
//  Created by Sumeet on 22/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

//outlet of UILabel
@property (weak, nonatomic) IBOutlet UILabel *Label;

//outlet of UILabel for max value
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;

//outlet of UITextField
@property (weak, nonatomic) IBOutlet UITextField *textField;

//outlet of UISlider
@property (weak, nonatomic) IBOutlet UISlider *Slider;

//action of slider
- (IBAction)sliderChanged:(id)sender;

//outlet of UILabel for tip
@property (weak, nonatomic) IBOutlet UILabel *currentTipLabel;

//action of button
- (IBAction)buttonPressed:(id)sender;

@end

