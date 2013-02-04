//
//  PictureViewController.m
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import "PictureViewController.h"
#import "OverlayViewController.h"


@interface PictureViewController () {
    bool newMedia;
    
}
@property (nonatomic, strong) OverlayViewController *overlay;
@end

@implementation PictureViewController
@synthesize overlay, picture;
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
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
//        [self.view addSubview:imagePicker.view];
        imagePicker.showsCameraControls = NO;
        imagePicker.navigationBarHidden = YES;
        imagePicker.toolbarHidden = YES;
        imagePicker.wantsFullScreenLayout = YES;
        
        self.overlay = [[OverlayViewController alloc] initWithNibName:@"OverlayViewController" bundle:nil];
        self.overlay.pickerReference = imagePicker;
        imagePicker.cameraOverlayView = self.overlay.view;
        imagePicker.delegate = self;
        imagePicker.delegate = self.overlay;
        [self presentModalViewController:imagePicker animated:YES];
      
        newMedia = YES;
    }

	// Do any additional setup after loading the view.
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    [self dismissModalViewControllerAnimated:YES];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        picture.image = image;
        
        if (newMedia){
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);}
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
		// Code here to support video if enabled
	}
}



- (void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
