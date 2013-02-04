//
//  DataViewController.h
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>

 
@interface DataViewController : UIViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *picture;
@property (nonatomic, strong) IBOutlet UIButton *skin;
@property (nonatomic, strong) IBOutlet UIButton *eye;
@property (nonatomic, strong) IBOutlet UIButton *other;
@property (nonatomic, strong) IBOutlet UIButton *throat;
@property (nonatomic, strong) IBOutlet UISegmentedControl *maleFemale;
@property (nonatomic, strong) IBOutlet UITextView *description;


-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

-(IBAction)addOrTakePic:(id)sender;
-(IBAction)didPressDone:(id)sender;
-(IBAction)buttonPressed:(id)sender;
-(IBAction)skin:(id)sender;
-(IBAction)eye:(id)sender;
-(IBAction)throat:(id)sender;
-(IBAction)other:(id)sender;
@end
