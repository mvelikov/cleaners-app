//
//  CleanersListTableViewController.m
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import "CleanersListTableViewController.h"

@implementation CleanersListTableViewController

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
                       @"name" : @"Anastasia",
                       @"rank" : @9,
                       @"stars": @3.5,
                       @"photo": @"img1"
                       },
                   @{
                       @"name" : @"Maria",
                       @"rank" : @4,
                       @"stars": @5,
                       @"photo": @"img2"
                       },
                   @{
                       @"name" : @"Mirela",
                       @"rank" : @9,
                       @"stars": @4.5,
                       @"photo": @"img3"
                       },
                   ];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    } else {
        return [_dataItems count];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == 0) {
        return 70.;
    } else {
        return 86.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cleanerCell";
    id cell;
    if ([indexPath section] == 1) {
        CleanerTableViewCell *cleanerCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            cell = [[CleanerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellIdentifier];
        }
        // Configure the cell...
        id item = [_dataItems objectAtIndex:indexPath.row];
        int starsInt = [[item valueForKey:@"stars"] intValue], i;
        float starsFloat = [[item valueForKey:@"stars"] floatValue];
        NSArray *stars = @[cleanerCell.star1, cleanerCell.star2, cleanerCell.star3, cleanerCell.star4, cleanerCell.star5];

        [cleanerCell.name setText:[item valueForKey:@"name"]];
        [cleanerCell.photo setImage:[UIImage imageNamed:[item valueForKey:@"photo"]]];
        [cleanerCell.rank setText:[NSString stringWithFormat:@"%@", [item valueForKey:@"rank"]]];
        
        UIImageView *star;
        for (i = 0; i < starsInt; i++) {
            star = [stars objectAtIndex:i];
            [star setImage:[UIImage imageNamed:@"star"]];
        }
        
        if (starsInt < ceilf(starsFloat) && starsInt < 5) {
            star = [stars objectAtIndex:i];
            [star setImage:[UIImage imageNamed:@"half_star"]];
            i++;
        }
        
        for (; i < 5; i++) {
            star = [stars objectAtIndex:i];
            [star setImage:[UIImage imageNamed:@"blank_star"]];
        }
        
        if ([indexPath row] % 2) {
            cleanerCell.backgroundColor = [UIColor colorWithRed:235/255. green:235/255. blue:235/255. alpha:1];
        }
        
        cell = cleanerCell;
    } else {
        LogoTableViewCell *logoCell = [tableView dequeueReusableCellWithIdentifier:@"logoCell"];
        
        if (logoCell == nil) {
            logoCell = [[LogoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:cellIdentifier];
        }
        [logoCell.logo setImage:[UIImage imageNamed:@"logo"]];
        
        cell = logoCell;
    }
    
    return cell;
}

@end
