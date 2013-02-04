//
//  ReviewCell.h
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *iconView;
@property (nonatomic, strong) IBOutlet UITextView *reviewText;
@property (nonatomic, strong) IBOutlet UILabel *type;


@end
