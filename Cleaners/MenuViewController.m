//
//  MenuViewController.m
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import "MenuViewController.h"

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)homeButtonTapped:(id)sender {
}

- (IBAction)cleaningButtonTapped:(id)sender {
    [_cleaningActiveImage setHidden:NO];
    [_operatorsActiveImage setHidden:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *cleanersController = (UIViewController *) [storyboard instantiateViewControllerWithIdentifier:@"cleanersList"];
    
    UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
    
    [navController pushViewController:cleanersController animated:NO];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
}

- (IBAction)operatorButtonTapped:(id)sender {
    [_cleaningActiveImage setHidden:YES];
    [_operatorsActiveImage setHidden:NO];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *operatorsController = (UIViewController *) [storyboard instantiateViewControllerWithIdentifier:@"operatorsList"];
    
    UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;

//  I would rather use instead of push [navController setViewControllers:@[operatorsController] animated:NO];
//  I did use push because of the requirement that say
// "in the navigation bar there are two buttons. The one on the left is for going back one step."
    [navController pushViewController:operatorsController animated:NO];

    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
}

- (IBAction)officeButtonTapped:(id)sender {
}

- (IBAction)placesButtonTapped:(id)sender {
}
@end
