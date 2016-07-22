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
@synthesize Label,textField,Slider,currentTipLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
    
    float billAmount = [userInput floatValue];
    float tipAmount = [Slider value] * billAmount;
    
    NSString *tipString = [[NSString alloc]initWithFormat:@"%1.2f",tipAmount ];
    
    Label.text = tipString;
}
@end
