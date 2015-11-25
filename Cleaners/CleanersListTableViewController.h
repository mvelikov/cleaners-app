//
//  CleanersListTableViewController.h
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "CleanerTableViewCell.h"
#import "LogoTableViewCell.h"

@interface CleanersListTableViewController : UITableViewController
@property (nonatomic) NSArray *dataItems;
@end
