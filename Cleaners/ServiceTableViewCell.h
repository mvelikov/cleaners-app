//
//  ServiceTableViewCell.h
//  Cleaners
//
//  Created by Mihail Velikov on 10/16/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIImageView *promo;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
