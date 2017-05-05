//
//  loginViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 15/12/2016.
//  Copyright © 2016 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@end
