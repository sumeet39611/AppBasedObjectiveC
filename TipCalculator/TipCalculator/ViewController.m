//
//  ViewController.m
//  TipCalculator
//
//  Created by BridgeLabz on 22/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Label,textField,Slider,currentTipLabel,maxLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //changing slider maxValue to 40
    Slider.maximumValue = 0.4;
    NSString *tipString = [[NSString alloc]initWithFormat:@"%1.2f%%",[Slider maximumValue] * 100 ];
    
    maxLabel.text = tipString;
    
    //want only numeric keypad
    //textField.keyboardType = UIKeyboardTypeNumberPad;
    

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sliderChanged:(id)sender {
    
    NSString *currentTipString = [[NSString alloc] initWithFormat:@"%1.2f%%", [Slider value] * 100];
    
    currentTipLabel.text = currentTipString;
}


- (IBAction)buttonPressed:(id)sender {
    NSString *userInput= [textField text];
    
    if ([userInput length] == 0) {
        
        //adding alert view if no amount is entered and you want to calculate tip
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Bill Amount" message:@"You forget to type in Bill Amount" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alertView addAction:defaultAction];
        [self presentViewController:alertView animated:YES completion:nil];
        
    } else {
        
        float billAmount = [userInput floatValue];
        float tipAmount = [Slider value] * billAmount;
        
        NSString *tipString = [[NSString alloc]initWithFormat:@"%1.2f",tipAmount ];
        
        Label.text = tipString;
        
    }
    
}
@end
