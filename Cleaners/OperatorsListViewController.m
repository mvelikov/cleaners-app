//
//  CleanersListViewController.m
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import "OperatorsListViewController.h"

@implementation OperatorsListViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    UIImage *back = [[UIImage imageNamed:@"back-button"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal],
    *menu = [[UIImage imageNamed:@"menu-button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:back
                                                                   style:UIBarButtonItemStylePlain target:self.navigationController
                                                                  action:@selector(popViewControllerAnimated:)],
    *menuButton = [[UIBarButtonItem alloc] initWithImage:menu
                                                   style:UIBarButtonItemStylePlain
                                                  target:self.revealViewController
                                                  action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationItem.rightBarButtonItem = menuButton;
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    [self.navigationItem setHidesBackButton:NO];
    
    self.title = @"CRM FTW";
    
    _dataItems = @[
                   @{
                        @"photo" : @"operator1",
                        @"online" : @1
                    },
                   @{
                       @"photo" : @"operator2",
                       @"online" : @1
                       },
                   @{
                       @"photo" : @"operator3",
                       @"online" : @0,
                       },
                   @{
                       @"photo" : @"operator4",
                       @"online" : @1,
                       },
                   @{
                       @"photo" : @"operator5",
                       @"online" : @1,
                       }
                   ];
    _topOffers = @[
                   @{
                       @"banner" : @"offer1"
                       },
                   @{
                       @"banner" : @"offer2"
                       },
                   @{
                       @"banner" : @"offer3"
                       },
                   @{
                       @"banner" : @"offer4"
                       },
                   @{
                       @"banner" : @"offer1"
                       },
                   ];
    _services = @[
                  @{
                      @"name" : @"House Cleaning Islington!",
                      @"promo" : @1,
                      @"icon" : @"serv_icon_1"
                      },
                  @{
                      @"name" : @"Domestic Cleaners Islington!",
                      @"promo" : @0,
                      @"icon" : @"serv_icon_2"
                      },
                  @{
                      @"name" : @"Deep Cleaning Islington!",
                      @"promo" : @0,
                      @"icon" : @"serv_icon_3"
                      },
                  @{
                      @"name" : @"End of Tenancy Cleaning Islington!",
                      @"promo" : @1,
                      @"icon" : @"serv_icon_4"
                      },
                  @{
                      @"name" : @"One­off Spring Cleaning Islington!",
                      @"promo" : @0,
                      @"icon" : @"serv_icon_5"
                      },
                  @{
                      @"name" : @"Overnight End of Tenancy Cleaning Islington! Dog Walking Islington!",
                      @"promo" : @0,
                      @"icon" : @"serv_icon_1"
                      },
                  @{
                      @"name" : @"Pet Sitting Islington!",
                      @"promo" : @0,
                      @"icon" : @"serv_icon_2"
                      },
                  @{
                      @"name" : @"Carpet Cleaning Islington! Upholstery Cleaning Islington! Dry Cleaning Islington!",
                      @"promo" : @1,
                      @"icon" : @"serv_icon_3"
                      },
                  @{
                      @"name" : @"Oven Cleaning Islington! Rubbish Clearance Islington!",
                      @"promo" : @1,
                      @"icon" : @"serv_icon_4"
                      }
                ];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    NSInteger count;
    if (view == _operatorsCollection) {
        count = [_dataItems count];
    } else if (view == _offersCollection) {
        count = [_topOffers count];
    }
    
    return count;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id retCell;
    
    if (cv == _operatorsCollection) {
        OperatorCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"operatorCell" forIndexPath:indexPath];

        id operator = [_dataItems objectAtIndex:[indexPath row]];
        [cell.photo setImage:[UIImage imageNamed:[operator valueForKey:@"photo"]]];
        cell.photo.layer.cornerRadius = 8.0;
        BOOL isOperatorOnline = [[operator valueForKey:@"online"] boolValue];
        if (isOperatorOnline) {
            [cell.operatorOnImage setHidden:NO];
        } else {
            [cell.operatorOnImage setHidden:YES];
        }
        retCell = cell;
    } else if (cv == _offersCollection) {
        TopOfferCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"topOfferCell" forIndexPath:indexPath];
        
        id offer = [_topOffers objectAtIndex:[indexPath row]];
        [cell.banner setImage:[UIImage imageNamed:[offer valueForKey:@"banner"]]];
        
        retCell = cell;
    }
    

    return retCell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,0,0,0);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_services count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"serviceItem";
    ServiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[ServiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:cellIdentifier];
    }
    
    id serviceItem = [_services objectAtIndex:[indexPath row]];
    
    [cell.icon setImage:[UIImage imageNamed:[serviceItem valueForKey:@"icon"]]];
    [cell.name setText:[serviceItem valueForKey:@"name"]];
    
    BOOL isOnPromo = [[serviceItem valueForKey:@"promo"] boolValue];
    
    if (isOnPromo) {
        [cell.promo setHidden:NO];
    } else {
        [cell.promo setHidden:YES];
    }
    
    if ([indexPath row] % 2) {
        cell.backgroundColor = [UIColor colorWithRed:235/255. green:235/255. blue:235/255. alpha:1];
    }
    
    return cell;
}
@end
