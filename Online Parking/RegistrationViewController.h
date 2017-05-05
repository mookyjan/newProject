//
//  RegistrationViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 16/12/2016.
//  Copyright © 2016 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIImageView *registerIconImageView;

@end
