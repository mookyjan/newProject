//
//  vehicleRegistrationViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 19/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vehicleRegistrationViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UITextField *MakeTextField;
@property (weak, nonatomic) IBOutlet UITextField *modelTextField;
@property (weak, nonatomic) IBOutlet UITextField *licensePlate;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end
