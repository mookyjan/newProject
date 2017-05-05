//
//  vehicleRegistrationViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 19/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "vehicleRegistrationViewController.h"

@interface vehicleRegistrationViewController ()

@end

@implementation vehicleRegistrationViewController{
    UIImagePickerController *picker;
    UIImage *image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)photoLibrary:(id)sender {
    picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker animated:YES completion:nil];
    self.cameraButton.hidden = self;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)registerVehicle:(id)sender {
    if([self.MakeTextField.text isEqualToString:@""] ||
        [self.modelTextField.text isEqualToString:@""] ||
        [self.licensePlate.text isEqualToString:@""] ||
        [self.descriptionTextField.text isEqualToString:@""] ||
        [self.MakeTextField.text isEqualToString:@"Make"] ||
        [self.modelTextField.text isEqualToString:@"Model"] ||
        [self.licensePlate.text isEqualToString:@"License_Plate"]||
        [self.descriptionTextField.text isEqualToString:@"Color"])
    {
        UIAlertController *alertController1 = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Fill all required fields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alertController1 addAction:alertAction1];
        [self presentViewController:alertController1 animated:YES completion:nil];
    }
    else{
        //.......... session_variable.....
        NSString *session_variable = [[NSUserDefaults standardUserDefaults]
                                      stringForKey:@"email"];
        //..................................
        NSString *rawStr = [NSString stringWithFormat:@"make=%@& model=%@& license_plate=%@& color=%@& user_email=%@&",
                            self.MakeTextField.text,
                            self.modelTextField.text,
                            self.licensePlate.text,
                            self.descriptionTextField.text,
                            session_variable];
        
        NSData *data = [rawStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/vehicle_registration.php"];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:data];
        NSURLResponse *response;
        NSError *err;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        NSString *responseString = [NSString stringWithUTF8String:[responseData bytes]];
        NSString *success = @"success";
        [success dataUsingEncoding:NSUTF8StringEncoding];
        if([responseString isEqualToString:@"Yes"])
        {
            UIAlertView *alertSuccess = [[UIAlertView alloc]initWithTitle:@"Congratulation" message:@"Your car is successfully registered" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            [alertSuccess show];
            [self performSelector:@selector(byeAlertSuccess:) withObject:alertSuccess afterDelay:1];
        }
    }
}
-(void)byeAlertSuccess:(UIAlertView*)alertSuccess{
    [alertSuccess dismissWithClickedButtonIndex:0 animated:YES];
    [self performSegueWithIdentifier:@"success_segue" sender:self];
}
@end
