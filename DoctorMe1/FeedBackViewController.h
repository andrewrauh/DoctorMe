//
//  FeedBackViewController.h
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FeedBackViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@property  (nonatomic, strong) NSArray *dataArray;




@end
