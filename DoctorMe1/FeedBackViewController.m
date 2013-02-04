//
//  FeedBackViewController.m
//  DoctorMe1
//
//  Created by Andrew Rauh on 2/2/13.
//  Copyright (c) 2013 Andrew Rauh. All rights reserved.
//

#import "FeedBackViewController.h"
#import "ReviewCell.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController
@synthesize myTableView, dataArray;

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
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    dataArray = [[NSArray alloc]init];
    PFQuery *sympQuery = [PFQuery queryWithClassName:@"Symptoms"];

    dataArray = [sympQuery findObjects];

	// Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Number of rows called");
    // Return the number of rows in the section.
    return [dataArray count];
//    return 100;
}

// Customize the appearance of table view cells.
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
//    PFObject *curItem = dataArray[indexPath.row];
//
//    PFFile *img = [curItem objectForKey:@"Photo"];
//    if (img) {
//        NSData *imgData = [img getData];
//        [cell.imageView setImage:[UIImage imageWithData:imgData]];
//
//    }
//    
//    [cell.textLabel setText:[curItem objectForKey:@"Symptom"]];
//    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
//    
////    PFObject *curTrans = pendingTransactions[indexPath.row];
////    
////    PFObject *curItem = [[curTrans objectForKey:@"item"]fetchIfNeeded];
////    
////    //    NSLog(@"Item object Id: %@" , curItem);
////    
////    //    NSLog(@"Item object Id: %@" , [[curItem objectForKey:@"title"]);
////    
////    PFFile *img = [curItem objectForKey:@"image"];
////    if (img) {
////        NSData *imgData = [img getData];
////        [cell.imageView setImage:[UIImage imageWithData:imgData]];
////    } else {
////        [cell.imageView setImage:[UIImage imageNamed:@"chris2.png"]];
////    }
////    
////    [cell.detailTextLabel setText:[curItem objectForKey:@"title"]];
//    return cell;
//}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *uniqueIdentifier = @"reviewCell";
    
    ReviewCell  *cell = nil;
    
    cell = (ReviewCell *) [self.myTableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    
        
    if(!cell)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ReviewCell" owner:nil options:nil];
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[ReviewCell class]])
            {
                cell = (ReviewCell *)currentObject;
                break;
            }
        }
    }
    
    PFObject *curItem = dataArray[indexPath.row];
    PFFile *img = [curItem objectForKey:@"Photo"];
        if (img) {
            NSData *imgData = [img getData];
            [cell.iconView setImage:[UIImage imageWithData:imgData]];
    
       }
    
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bh_gradient.png"]];
    
    if ( [curItem objectForKey:@"Review"] == nil) {
        [cell.reviewText setText:@"Under Review"];
    }
    else  {
        [cell.reviewText setText:[curItem objectForKey:@"Review"]];

    }
    [cell.type setText:[curItem objectForKey:@"Symptom"]];
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    CompleteTransactionViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"CompleteVC"];
    //    [controller setSelectedItem:[webServices.allItems objectAtIndex:indexPath.row]];
//    PFObject *curTrans = pendingTransactions[indexPath.row];
//    PFObject *curItem = [[curTrans objectForKey:@"item"] fetchIfNeeded];
//    PFFile *img = [curItem objectForKey:@"image"];
//    [controller setImage:img];
//    [controller setItem:curItem];
//    [controller setTransaction:curTrans];
//    [self.navigationController pushViewController:controller animated:YES];
    
    //    [self.navigationController pushViewController:controller animated:YES];
}

- (void) reloadTableView{
//    [mytableView performSelectorOnMainThread:@selector(reloadData) withObject:self waitUntilDone:YES];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
