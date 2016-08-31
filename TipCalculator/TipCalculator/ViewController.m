//
//  ViewController.m
//  TipCalculator
//
//  Generating tip calculator
//
//  Created by Sumeet on 22/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

@synthesize Label,textField,Slider,currentTipLabel,maxLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.textField.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    //adding tap gesture to view
    [self.view addGestureRecognizer:tap];
    
    //changing slider maxValue to 40
    Slider.maximumValue = 0.4;
    
    NSString *tipString = [[NSString alloc]initWithFormat:@"%1.2f%%",[Slider maximumValue] * 100 ];
    
    maxLabel.text = tipString;
    
    //want only numeric keypad
    //textField.keyboardType = UIKeyboardTypeNumberPad;
    // Do any additional setup after loading the view, typically from a nib.
}

//dissmissing keyboard
-(void)dismissKeyboard
{
    [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//action on changing slider
- (IBAction)sliderChanged:(id)sender
{
    NSString *currentTipString = [[NSString alloc] initWithFormat:@"%1.2f%%", [Slider value] * 100];
    
    //setting slider value
    currentTipLabel.text = currentTipString;
}

//action on button click
- (IBAction)buttonPressed:(id)sender
{
    NSString *userInput= [textField text];
     [textField resignFirstResponder];
    
    if ([userInput length] == 0)
    {
        //adding alert view if no amount is entered and you want to calculate tip
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Bill Amount" message:@"You forget to type in Bill Amount" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        //adding action to alertView
        [alertView addAction:defaultAction];
        
        //adding alertView to view
        [self presentViewController:alertView animated:YES completion:nil];
        
    }
    else
    {
        float billAmount = [userInput floatValue];
        float tipAmount = [Slider value] * billAmount;
        NSString *tipString = [[NSString alloc]initWithFormat:@"%1.2f",tipAmount ];
        
        //setting tip value
        Label.text = tipString;
    }
}

@end
