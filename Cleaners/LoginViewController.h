//
//  LoginViewController.h
//  Cleaners
//
//  Created by Mihail Velikov on 10/15/15.
//  Copyright © 2015 FOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;

- (IBAction)signInButtonTapped:(id)sender;
@end
