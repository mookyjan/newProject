//
//  RegistrationViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 16/12/2016.
//  Copyright © 2016 SoftBrain. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController{
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    //..............firstNameTextField.............
    self.firstNameTextField.layer.cornerRadius = 15;
    self.firstNameTextField.layer.borderWidth = 0.6f;
    self.firstNameTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.firstNameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    //..............lastTextField.............
    self.lastNameTextField.layer.cornerRadius = 15;
    self.lastNameTextField.layer.borderWidth = 0.6f;
    self.lastNameTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.lastNameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Last name" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    //..............EmailTextField.............
    self.emailTextField.layer.cornerRadius = 15;
    self.emailTextField.layer.borderWidth = 0.6f;
    self.emailTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"email" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    //..............passwordTextField.............
    self.passwordTextField.layer.cornerRadius = 15;
    self.passwordTextField.layer.borderWidth = 0.6f;
    self.passwordTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    //..............confirmPasswordTextField.............
    self.confirmPassword.layer.cornerRadius = 15;
    self.confirmPassword.layer.borderWidth = 0.6f;
    self.confirmPassword.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.confirmPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm password" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    //..............phoneNumberTextField.............
    self.phoneNumberTextField.layer.cornerRadius = 15;
    self.phoneNumberTextField.layer.borderWidth = 0.6f;
    self.phoneNumberTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.phoneNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Phone number" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    
    //..............SignUpButton.............
    self.signUpButton.layer.cornerRadius = 15;
    self.signUpButton.layer.borderWidth = 0.6f;
    self.signUpButton.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    //..............SignUpicon.............
    self.registerIconImageView.layer.cornerRadius = self.registerIconImageView.frame.size.width / 2;
    self.registerIconImageView.layer.borderWidth = 3.0f;
    self.registerIconImageView.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.registerIconImageView.layer.masksToBounds = YES;
}
- (IBAction)registrationButton:(id)sender {
    if ([self.firstNameTextField.text isEqualToString:@""] ||
        [self.lastNameTextField.text isEqualToString:@""] ||
        [self.emailTextField.text isEqualToString:@""] ||
        [self.phoneNumberTextField.text isEqualToString:@""] ||
        [self.passwordTextField.text isEqualToString:@""] ||
        [self.confirmPassword.text isEqualToString:@""] ||
        [self.phoneNumberTextField.text isEqualToString:@""]||
        ![self.passwordTextField.text isEqualToString:self.confirmPassword.text])
        
    {
        UIAlertController *alertController1 = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Enter the required field" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController1 addAction:alertAction1];
        [self presentViewController:alertController1 animated:YES completion:nil];
        
    }
    else{
    NSString *rawStr = [NSString stringWithFormat:@"firstname=%@& lastname=%@& email=%@& password=%@& phone_number=%@&",
                        self.firstNameTextField.text,
                        self.lastNameTextField.text,
                        self.emailTextField.text,
                        self.passwordTextField.text,
                        self.phoneNumberTextField.text];
    
    NSData *data = [rawStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/user_registration.php"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    NSURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *responseString = [NSString stringWithUTF8String:[responseData bytes]];
   // NSString *success = @"success";
   // [success dataUsingEncoding:NSUTF8StringEncoding];
        if([responseString isEqualToString:@"Yes"])
        {
            UIAlertView *alertSuccess = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"You are successfully registered" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [alertSuccess show];
            [self performSelector:@selector(byeAlertSuccess:) withObject:alertSuccess afterDelay:1];
        }
    }
}
-(void)byeAlertSuccess:(UIAlertView*)alertSuccess{
    [alertSuccess dismissWithClickedButtonIndex:0 animated:YES];
    [self performSegueWithIdentifier:@"login_segue" sender:self];
}
/*-(void)timerMethod{
    //[timer invalidate];
    [self performSegueWithIdentifier:@"login_segue" sender:self];
}*/



@end
