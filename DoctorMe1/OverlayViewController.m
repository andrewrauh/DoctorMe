//
//  OverlayViewController.m
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import "OverlayViewController.h"

@interface OverlayViewController ()

@end

@implementation OverlayViewController
@synthesize pickerReference;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)takePhoto:(id)sender {
    [self.pickerReference takePicture];
}

-(IBAction)cameraRoll:(id)sender {
    [self.pickerReference setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
}


@end
