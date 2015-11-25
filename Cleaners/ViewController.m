//
//  ViewController.m
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.revealViewController.rearViewRevealWidth = 55;
    
    if ([[ UIScreen mainScreen ] bounds ].size.height == 568.) {
        _image.image = [UIImage imageNamed:@"init-568h"];
        
    } else {
          _image.image = [UIImage imageNamed:@"init"];
    }
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchToLoginButtonTapped:(id)sender {
}
@end
