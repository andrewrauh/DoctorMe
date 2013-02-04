//
//  DataViewController.m
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import "DataViewController.h"
#import <Parse/Parse.h>

@interface DataViewController () {
    BOOL newMedia;
    BOOL isSkin;
    BOOL isThroat;
    BOOL isOther;
    BOOL isEye;
}

@end

@implementation DataViewController
@synthesize picture, skin, eye, other, throat, maleFemale, description;

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
-(IBAction)addOrTakePic:(id)sender {
    NSString *other1 = @"Take Picture";
    NSString *other2 = @"Choose From Camera Roll";
    NSString *cancelTitle = @"Cancel Button";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2, nil];
    [actionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
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
            [self presentModalViewController:imagePicker animated:YES];
            newMedia = YES;
        }
    }
    else if (buttonIndex == 1) {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
            
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                      (NSString *) kUTTypeImage,
                                      nil];
            imagePicker.allowsEditing = NO;
            [self presentModalViewController:imagePicker animated:YES];
            newMedia = NO;
            
        }
    }
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

-(IBAction)buttonPressed:(id)sender
{
    [self performSelector:@selector(doHighlight:) withObject:sender afterDelay:0];

}

- (void)doHighlight:(UIButton*)button {
    if ( button.selected ) {
                   button.highlighted = NO;
                    button.selected = NO;
                } else {
                    button.highlighted = YES;
                    button.selected = YES;
                    if (button.titleLabel.text == @"skin") {
                        isSkin = YES;
                    }
                    else if (button.titleLabel.text == @"eye"){
                        isEye = YES;
                    }
                    else if (button.titleLabel.text == @"throat") {
                        isThroat = YES;
                        }
                    else if (button.titleLabel.text == @"other") {
                        isOther = YES;
                    }
                }
}


-(IBAction)didPressDone:(id)sender {
    
    PFObject *dataObject = [PFObject objectWithClassName:@"Symptoms"];
    CGSize halfSize = CGSizeMake(picture.image.size.width*0.07, picture.image.size.height*0.07);
    
    UIImage *newImage = [self imageWithImage:picture.image scaledToSize:halfSize];
    picture.image = newImage;

    NSData *imageData = UIImagePNGRepresentation(picture.image);
    PFFile *imageFile = [PFFile fileWithName:@"picture" data:imageData];
    if (isEye) {
        [dataObject setObject:@"Eye" forKey:@"Symptom"];
        
    }
    else if (isSkin) {
        [dataObject setObject:@"Skin" forKey:@"Symptom"];        
    }
    else if (isThroat) {
        [dataObject setObject:@"Throat" forKey:@"Symptom"];
    }
    else if (isOther){
        [dataObject setObject:@"Other" forKey:@"Symptom"];

    }
    [imageFile save];
    
    [dataObject setObject:imageFile forKey:@"Photo"];
    [dataObject setObject:description.text forKey:@"description"];
    // This will save both myPost and myComment
    [dataObject saveInBackground];
    
    [self.navigationController popViewControllerAnimated:YES];

}

-(IBAction)skin:(id)sender {
    if (isSkin) {
        isSkin = NO;
    }
    else {
        isSkin = YES;
    }
    
}
-(IBAction)eye:(id)sender{
    if (isEye) {
        isEye = NO;
    }
    else {
        isEye = YES;

    }
}
-(IBAction)throat:(id)sender{
    if (isThroat) {
        isThroat = NO;
    }
    else {
        isThroat = YES;

    }
}
-(IBAction)other:(id)sender{
    if (isOther) {
        isOther = NO;
    }else {
        isOther = YES;

    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
