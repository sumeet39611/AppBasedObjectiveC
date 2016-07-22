//
//  ViewController.h
//  SimpleCalculator
//
//  Created by BridgeLabz on 22/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) BOOL typingNumber;
@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;
@property (nonatomic, copy) NSString *operation;



-(IBAction)pressedNumber:(UIButton *)sender;
-(IBAction)pressedCalculation:(id)sender;
-(IBAction)pressedEqual;

- (IBAction)clear:(id)sender;

@end

