//
//  ViewController.m
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize eyeView, labelOne , reviewView, labelTwo, mainScrollView, firstImage, secondImage, pageControl, text1, text2;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setBackgroundImage:
    [UIImage imageNamed:@"WelcomeTopBar"]forBarMetrics:UIBarMetricsDefault];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    mainScrollView.delegate = self;
    [mainScrollView setPagingEnabled:YES];
    firstImage = [[UIImageView alloc]init];
    secondImage = [[UIImageView alloc]init];
    
    [firstImage setImage:[UIImage imageNamed:@"clipboard.png"]];
    [secondImage setImage:[UIImage imageNamed:@"sickperson.png"]];
    
    [self.mainScrollView setFrame:CGRectMake(0, 20, 320, 275)];
    self.mainScrollView.contentSize = CGSizeMake(640, 275);

    [firstImage setFrame:CGRectMake(0, 20, 320, 275)];
    [secondImage setFrame:CGRectMake(320, 20, 320, 275)];
    text1 = [[UIImageView alloc]init];
    text2 = [[UIImageView alloc]init];
    [text1 setFrame:CGRectMake(65, 355, 191, 18)];
    [text2 setFrame:CGRectMake(320+45, 355, 230, 14.5)];
    
    [text1 setImage:[UIImage imageNamed:@"textOne_0000_Send-Your-Symptoms"]];
    [text2 setImage:[UIImage imageNamed:@"textTwo_0000_Receive-a-Doctor’s-Review"]];\
    
    [self.mainScrollView addSubview:firstImage];
    [self.mainScrollView addSubview:secondImage];
    [self.mainScrollView addSubview:text1];
    [self.mainScrollView addSubview:text2];
    
    [pageControl setNumberOfPages:2];

}



- (IBAction)changePage {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.mainScrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.mainScrollView.frame.size;
    [self.mainScrollView scrollRectToVisible:frame animated:YES];
}

-(void) viewDidAppear:(BOOL)animated {
//    if (![PFUser currentUser]) { // No user logged in
//        // Create the log in view controller
//        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
//        [logInViewController setDelegate:self]; // Set ourselves as the delegate
//        
//        // Create the sign up view controller
//        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
//        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
//        
//        // Assign our sign up controller to be displayed from the login controller
//        [logInViewController setSignUpController:signUpViewController];
//        
//        // Present the log in view controller
//        [self presentViewController:logInViewController animated:YES completion:NULL];
//    }

}


-(IBAction)didPressMenu:(id)sender{
    
    
}

//- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
//    // Check if both fields are completed
//    if (username && password && username.length != 0 && password.length != 0) {
//        return YES; // Begin login process
//    }
//    
//    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
//                                message:@"Make sure you fill out all of the information!"
//                               delegate:nil
//                      cancelButtonTitle:@"ok"
//                      otherButtonTitles:nil] show];
//    return NO; // Interrupt login process
//}
//

//// Sent to the delegate when a PFUser is logged in.
//- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}
//
//
//
//// Sent to the delegate when the log in attempt fails.
//- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
//    NSLog(@"Failed to log in...");
//}
//
//// Sent to the delegate when the log in screen is dismissed.
//- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
//    [self.navigationController popViewControllerAnimated:YES];
//}

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
//- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
//    BOOL informationComplete = YES;
//    
//    // loop through all of the submitted data
//    for (id key in info) {
//        NSString *field = [info objectForKey:key];
//        if (!field || field.length == 0) { // check completion
//            informationComplete = NO;
//            break;
//        }
//    }
//    
//    // Display an alert if a field wasn't completed
//    if (!informationComplete) {
//        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
//                                    message:@"Make sure you fill out all of the information!"
//                                   delegate:nil
//                          cancelButtonTitle:@"ok"
//                          otherButtonTitles:nil] show];
//    }
//    return informationComplete;
//}


//// Sent to the delegate when a PFUser is signed up.
//- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
//    [self dismissModalViewControllerAnimated:YES]; // Dismiss the PFSignUpViewController
//}
//
//// Sent to the delegate when the sign up attempt fails.
//- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
//    NSLog(@"Failed to sign up...");
//}
//
//// Sent to the delegate when the sign up screen is dismissed.
//- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
//    NSLog(@"User dismissed the signUpViewController");
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = scrollView.bounds.size.width;
    NSInteger pageNumber = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = pageNumber;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
