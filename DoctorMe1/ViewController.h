//
//  ViewController.h
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic,strong) IBOutlet UIImageView *eyeView;
@property (nonatomic,strong) IBOutlet UILabel *labelOne;
@property (nonatomic, strong) IBOutlet UIImageView *reviewView;
@property(nonatomic, strong) IBOutlet UILabel *labelTwo;
@property (nonatomic, strong) UIImageView *firstImage;
@property (nonatomic, strong) UIImageView *secondImage;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) IBOutlet UIImageView *text1;
@property (nonatomic, strong) IBOutlet UIImageView *text2;

- (IBAction)changePage;
-(IBAction)didPressMenu:(id)sender;


@end
