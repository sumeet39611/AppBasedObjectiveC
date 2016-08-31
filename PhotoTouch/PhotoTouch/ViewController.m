//
//  ViewController.m
//  PhotoTouch
//
//  Creating pan and tap gesture on image
//
//  Created by Sumeet on 27/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //getting audio service
    NSURL *soundURL= [[NSBundle mainBundle] URLForResource:@"click" withExtension:@"aiff"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(soundURL), &mSound);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//action on click of button
- (IBAction)addButtonPressed:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagePicker setDelegate:self];
    
    //adding image picker to view
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

//adding pan gesture for dragging image
-(void) panGestureRecognized: (UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint newpoint = [gestureRecognizer locationInView:[self view]];
    [[self view]bringSubviewToFront:[gestureRecognizer view]];
    [[gestureRecognizer view] setCenter:newpoint];
}


//adding tap gesture, on tap it zoom in image
-(void) tapGestureRecognized :(UITapGestureRecognizer *)gestureRecognizer
{
    [[self view] bringSubviewToFront:[gestureRecognizer view]];
    [UIView animateWithDuration:0.2 animations:^
    {
        [[gestureRecognizer view] setBounds:CGRectMake(0, 0, 100, 100)];
    }
    completion:^(BOOL finished)
    {
        [UIView animateWithDuration:0.2 animations:^
        {
            [[gestureRecognizer view] setBounds:CGRectMake(0, 0, 80, 80)];
            
        }];
    }];
}

//controlling pan and tap gestures
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image= [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:image];
    [newImageView setFrame:CGRectMake(-80, -80, 80, 80)];
    [newImageView setUserInteractionEnabled:YES];
    
    //calling pan gesture recognizer
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    [newImageView addGestureRecognizer:panGestureRecognizer];
    
    //calling tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [newImageView addGestureRecognizer:tapGestureRecognizer];
    
    [self dismissViewControllerAnimated:YES completion:^
    {
        AudioServicesPlaySystemSound(mSound);
        [[self view] addSubview:newImageView];
        [UIView animateWithDuration:0.2 animations:^
        {
            [newImageView setFrame:CGRectMake(arc4random_uniform(240), arc4random_uniform(300), 80, 80)];
        }];
    }];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
