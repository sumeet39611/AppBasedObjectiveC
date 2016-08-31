//
//  ViewController.h
//  PhotoTouch
//
//  Creating interface
//
//  Created by Sumeet on 27/07/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    SystemSoundID mSound;
}

//action of button
- (IBAction)addButtonPressed:(id)sender;

@end

