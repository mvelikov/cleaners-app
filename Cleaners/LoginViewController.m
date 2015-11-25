//
//  LoginViewController.m
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#define CORNER_RADIUS 4.0
#import "LoginViewController.h"

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([[ UIScreen mainScreen ] bounds ].size.height == 568.) {
        _image.image = [UIImage imageNamed:@"login-568h"];
        
    } else {
        _image.image = [UIImage imageNamed:@"login"];
    }
    
    _email.layer.borderColor = [[UIColor whiteColor] CGColor];
    _email.layer.borderWidth = 1.0;
    
    _password.layer.borderColor = [[UIColor whiteColor] CGColor];
    _password.layer.borderWidth = 1.0;
    
    _email.layer.cornerRadius = CORNER_RADIUS;
    _password.layer.cornerRadius = CORNER_RADIUS;
    _signInButton.layer.cornerRadius = CORNER_RADIUS;
    
    UIColor *color = [UIColor whiteColor];
    _email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email address" attributes:@{NSForegroundColorAttributeName: color}];

    _password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _email) {
        [_password becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self signInButtonTapped:self];
    }
    
    return YES;
}

- (IBAction)signInButtonTapped:(id)sender {
    NSString *emailString = [_email text], *passwordString = [_password text];

    if ([emailString isEqualToString:@"test@test.test"] &&
        [passwordString isEqualToString:@"1234"]) {
        [self performSegueWithIdentifier:@"showCleanersList" sender:self];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Wrong Email or Password"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
