//
//  ViewController.m
//  SimpleCalculator
//
//  Making simple calculator for operations addition, subtraction, multiplication
//
//  Created by Sumeet on 22/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField,typingNumber,firstNumber,secondNumber,operation;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textField.text = @"0";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//------------------------------------------------------------------------------
//for pressing buttons (0-9)
-(IBAction)pressedNumber:(UIButton *)sender
{
    NSString *number = sender.currentTitle;
    if (self.typingNumber)
    {
        //getting number
        self.textField.text = [self.textField.text
                               stringByAppendingString:number];
    }
    else
    {
        //getting number
        self.textField.text = number;
        self.typingNumber = YES;
    }
}

//------------------------------------------------------------------------------
//for pressing buttons (+,-,*)
- (IBAction)pressedCalculation:(id)sender
{
    self.typingNumber = NO;
    
    //getting first number here
    self.firstNumber = [self.textField.text intValue];
    
    //storing the operation we selected here
    self.operation = [sender currentTitle];
}

//-------------------------------------------------------------------------------
//for pressing button (=)
- (IBAction)pressedEqual
{
    self.typingNumber = NO;
    
    //getting second number here
    self.secondNumber = [self.textField.text intValue];
    
    int result = 0;
    
    //addition is done
    if ([self.operation isEqualToString:@"+"])
    {
        result = self.firstNumber + self.secondNumber;
    }
    //subtraction is done
    else if ([self.operation isEqualToString:@"-"])
        {
            result = self.firstNumber - self.secondNumber;
        }
        //multiplication is done
        else if ([self.operation isEqualToString:@"*"])
        {
            result = self.firstNumber * self.secondNumber;
        }
    
    //getting final result
    self.textField.text = [NSString stringWithFormat:@"%d", result];
}

//--------------------------------------------------------------------------------
//for pressing button (Clear)
- (IBAction)clear:(id)sender
{
    self.typingNumber = NO;
    
    //clearing first number
    self.firstNumber = NO;
    
    //clearing second number
    self.secondNumber = NO;
    
    //clearing textfield to 0
    self.textField.text =@"0";
}

//-----------------------------------------------------------------------------------
@end
