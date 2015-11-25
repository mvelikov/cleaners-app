//
//  CleanersListViewController.h
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "OperatorCell.h"
#import "TopOfferCell.h"
#import "ServiceTableViewCell.h"

@interface OperatorsListViewController : UIViewController

@property (nonatomic) NSArray *dataItems, *topOffers, *services;

@property (weak, nonatomic) IBOutlet UICollectionView *offersCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *operatorsCollection;

@end
