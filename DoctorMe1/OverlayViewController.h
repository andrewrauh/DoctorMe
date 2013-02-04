//
//  OverlayViewController.h
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverlayViewController : UIViewController
@property (nonatomic ,strong) UIImagePickerController *pickerReference;


-(IBAction)takePhoto:(id)sender;
-(IBAction)cameraRoll:(id)sender;
@end
