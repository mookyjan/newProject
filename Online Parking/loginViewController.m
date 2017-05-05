//
//  loginViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 15/12/2016.
//  Copyright © 2016 SoftBrain. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    //..............EmailTextField.............
    self.emailTextField.layer.cornerRadius = 15;
    self.emailTextField.layer.borderWidth = 0.6f;
    self.emailTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"email" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];


    //..............PasswordField.............
    self.passwordField.layer.cornerRadius = 15;
    self.passwordField.layer.borderWidth = 0.6f;
    self.passwordField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"password" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    //..............loginButton.............
    self.loginButton.layer.cornerRadius = 15;
    self.loginButton.layer.borderWidth = 0.6f;
    self.loginButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    //..............TopImageView.............
    self.topImageView.layer.cornerRadius = self.topImageView.frame.size.height / 2;
    self.topImageView.layer.borderWidth = 3.0f;
    self.topImageView.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.topImageView.layer.masksToBounds = YES;
    self.topImageView.clipsToBounds = YES;
    
}

- (IBAction)loginBtnTapped:(id)sender{
    
    
    if ([self.emailTextField.text isEqualToString:@""] || [self.passwordField.text isEqualToString:@""])
        
    {
        UIAlertController *alertController1 = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Enter email and password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController1 addAction:alertAction1];
        [self presentViewController:alertController1 animated:YES completion:nil];
    }
    else
    {
        
        NSString *email = self.emailTextField.text;
        NSString *password = self.passwordField.text;
        NSString *rawStr = [NSString stringWithFormat:@"email=%@& password=%@& ", email, password];
        
        NSData *data = [rawStr dataUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/user_login.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:data];
        NSURLResponse *response;
        NSError *err;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response
                                    error:&err];
        NSString *responseString = [NSString stringWithUTF8String:[responseData bytes]];
        if([responseString isEqualToString:@"Yes"])
        {
            //.............session variable.....................
            [[NSUserDefaults standardUserDefaults]
             stringForKey:@"email"];
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:self.emailTextField.text forKey:@"email"];
            //[userDefault setObject:self.passwordField.text forKey:@"password"];
            [userDefault synchronize];
            //..................................................
            [self performSegueWithIdentifier:@"submit_success" sender:self];
            
        } else {
            UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"Warning" message:@"incorrect email and password" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController2 addAction:alertAction2];
            [self presentViewController:alertController2 animated:YES completion:nil];
            
            ////.................clear the passwordTextField
            self.passwordField.text = @"";
        }
        
    }
}

@end
