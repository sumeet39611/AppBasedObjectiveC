//
//  ViewController.h
//  SimpleCalculator
//
//  Creating interface
//
//  Created by Sumeet on 22/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//outlet of UITextField
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) BOOL typingNumber;
@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;
@property (nonatomic, copy) NSString *operation;

// action of button for number
-(IBAction)pressedNumber:(UIButton *)sender;

//action of button for operations
-(IBAction)pressedCalculation:(id)sender;

//action of button for equal
-(IBAction)pressedEqual;

//action of button for clear
- (IBAction)clear:(id)sender;

@end

