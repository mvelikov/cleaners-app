//
//  CleanerTableViewCell.h
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CleanerTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *rank;
@property (nonatomic, weak) IBOutlet UIImageView *photo;

@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;

@end
