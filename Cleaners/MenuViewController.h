//
//  MenuViewController.h
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "MenuItemTableViewCell.h"

@interface MenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *homeActiveImage;
@property (weak, nonatomic) IBOutlet UIImageView *cleaningActiveImage;
@property (weak, nonatomic) IBOutlet UIImageView *operatorsActiveImage;
@property (weak, nonatomic) IBOutlet UIImageView *officeActiveImage;

@property (weak, nonatomic) IBOutlet UIImageView *placesActiveImage;

- (IBAction)homeButtonTapped:(id)sender;
- (IBAction)cleaningButtonTapped:(id)sender;
- (IBAction)operatorButtonTapped:(id)sender;
- (IBAction)officeButtonTapped:(id)sender;
- (IBAction)placesButtonTapped:(id)sender;
@end
