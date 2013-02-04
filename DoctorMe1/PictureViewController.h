//
//  PictureViewController.h
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface PictureViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) IBOutlet UIImageView *picture;
@end
