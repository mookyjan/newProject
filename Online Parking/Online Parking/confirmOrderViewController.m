//
//  confirmOrderViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 24/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "confirmOrderViewController.h"
#import "CardIO.h"
#import "CardIOPaymentViewControllerDelegate.h"
#import "OnlineParking-swift.h"
#import "checkoutKit/CheckoutKitObjC.h"
#import "checkoutKit/CardTokenResponse.h"
#import "checkoutKit/CardProviderResponse.h"
#import "AFNetworking.h"


@interface confirmOrderViewController ()<CardIOPaymentViewControllerDelegate>
{
    CardIOCreditCardInfo *cardInfo;

}
@end

@implementation confirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(320, 620)];
    self.noButton.layer.cornerRadius = 6.0;
    self.yesButton.layer.cornerRadius = 6.0;

    self.parkingNameLabel.text = [[NSUserDefaults standardUserDefaults]
                                  stringForKey:@"name"];
    self.licenseLabel.text = [[NSUserDefaults standardUserDefaults]
                              stringForKey:@"license"];
    self.startTimeLabel.text = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"startTime"];
    self.endTimeLabel.text = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"endTime"];
    //total fee
    long int fee = [[NSUserDefaults standardUserDefaults] integerForKey:@"parking_fee"];
    long int time = [[NSUserDefaults standardUserDefaults] integerForKey:@"activeTime"];
    long int totalFee = fee * time;
    self.totalFee.text =[NSString stringWithFormat:@"$%li", totalFee];
   /*
    //converting nsstring to nsdate(startTime)
    NSString *startDateStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"start_time"];
    NSLog(@"%@", startDateStr);
    NSDateFormatter *startDateFormat = [[NSDateFormatter alloc] init];
    [startDateFormat setDateFormat:@"MMM d, h:mm a"];
    NSDate *startDate = [startDateFormat dateFromString:startDateStr];
    self.startTimeLabel.text = [NSString stringWithFormat:@"%@", startDate];

    //converting nsstring to nsdate(endTime)
    NSString *endDateStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"end_time"];
    NSDateFormatter *endDateFormat = [[NSDateFormatter alloc] init];
    [endDateFormat setDateFormat:@"MMM d, h:mm a"];
    NSDate *endDate = [endDateFormat dateFromString:endDateStr];
    self.endTimeLabel.text = [NSString stringWithFormat:@"%@", endDate];
    */
}

- (IBAction)sendingDetailToServer:(id)sender {
    NSString *startTime = [[NSUserDefaults standardUserDefaults] stringForKey:@"start_time"];
    NSString *endTime = [[NSUserDefaults standardUserDefaults] stringForKey:@"end_time"];
    NSString *email = [[NSUserDefaults standardUserDefaults]
                       stringForKey:@"email"];
    NSString *parkingid = [[NSUserDefaults standardUserDefaults]                       stringForKey:@"parkingarea_id"];
    //converting parkingid to integer
    int parkingarea_id = [parkingid intValue];
    
    NSString *rawStr = [NSString stringWithFormat:
                        @"email=%@&  license_plate_no=%@& startTime=%@& endTime=%@& parkingarea_id=%d",
                        email,
                        self.licenseLabel.text,
                        startTime,
                        endTime,
                        parkingarea_id];
    NSData *data = [rawStr dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/reservation.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    NSURLResponse *response;
    NSError *err;
    NSData *responseData =  [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *responseString = [NSString stringWithUTF8String:[responseData bytes]];
    if([responseString isEqualToString:@"Yes"]){
        [self performSegueWithIdentifier:@"sessionSegue" sender:self];
        /*UIAlertView *successAlertView = [[UIAlertView alloc]initWithTitle:@"Success" message:@"You have successfully reserved a space" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [successAlertView show];
        [self performSelector:@selector(byeSuccessAlert) withObject:successAlertView afterDelay:1];*/
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Info" message:@"No Space available" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
   
}
/*-(void)byeAlertSuccess:(UIAlertView*)successAlertView{
    [successAlertView dismissWithClickedButtonIndex:0 animated:YES];
    [self performSegueWithIdentifier:@"sessionSegue" sender:self];
}*/



#pragma Mark -Card Scan Work-

#pragma mark - User Actions

- (void)scanCardClicked:(id)sender {
    
}

#pragma mark - CardIOPaymentViewControllerDelegate

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"Scan succeeded with info: %@", info.cardholderName);
    
    NSLog(@"card Number %@", info.cardNumber) ;
    NSLog(@"card Number %@", info.cardholderName) ;
    [self dismissViewControllerAnimated:YES completion:nil];

    
    
    // @note May be nil, if cardholder name was not requested.
//    txtOfInputNum.text = info.cardNumber ;
//    txtNameOnCard.text = info.cardholderName ;
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"User cancelled scan");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnScanCard_Pressed:(UIButton *)sender
{
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:scanViewController animated:YES completion:nil];
}


// Check Out Payment Work


- (IBAction)btnAddCard_Pressed:(UIButton *)sender
{
    
//    NUConfirmationPaymentController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NUConfirmationPaymentController"];
//    [self.navigationController pushViewController:vc animated:true];
    
        if (cardInfo != nil)
        {
                CheckoutKitObjC *checkoutKitInstance = [[CheckoutKitObjC alloc] init];
                [checkoutKitInstance setPublicKey:@"pk_test_b75ad8d0-ff15-4e2c-876b-e4388ede0b5c"];
                [checkoutKitInstance setEnvironment:@"SANDBOX"];
    
                Card *card = [Card alloc];
    
                [card setNumber:@"334234234"];
                [card setName:@"dfsasdfsdf"];
                [card setCvv:cardInfo.cvv];
                [card setExpMonth:[NSString stringWithFormat:@"%ld",(unsigned long)cardInfo.expiryMonth]];
                [card setExpYear:[NSString stringWithFormat:@"%ld",(unsigned long)cardInfo.expiryYear]];
    
                bool testCardValidity = [card verify];
    
//                [SVProgressHUD show];
    
                [checkoutKitInstance createCardToken:card success:^(CardTokenResponse *responseDict)
                 {
                     NSLog(@"%@",responseDict.cardToken);
                     NSLog(@"%@", responseDict.card);
    
                [self addCardInfo:responseDict.cardToken];
    
                 } failure:^(NSError *error) {
    
                     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Your Card information not correct." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                     [alertView show];

                     
//                    [self showAlertViewWithTitle:@"Information" message:@"Your Card information not correct."];
//                    [SVProgressHUD dismiss];
                 }];
            
    
        }
        else
        {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Please scan your card for fetching info." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];

        }
    
    
}


- (void)addCardInfo:(NSString *)token
{
    
    NSDictionary *param = nil ;
    
    //    NSDictionary *parameters = @{@"auth_token":objUser.auth_token, @"cardNum":cardInfo.redactedCardNumber, @"holderName":self.tfCarName.text, @"expiryMonth":[NSString stringWithFormat:@"%ld",(unsigned long)cardInfo.expiryMonth], @"expiryYear":[NSString stringWithFormat:@"%ld",(unsigned long)cardInfo.expiryYear], @"cvc":cardInfo.cvv, @"cardToken":token};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"Url" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSMutableDictionary *dic = (NSMutableDictionary *)responseObject;
        
        NSDictionary *dictU = [dic objectForKey:@"user"];
        NSDictionary *dictUser = [dictU objectForKey:@"User"];
        NSDictionary *dictCard = [dictUser objectForKey:@"Card"];
        
        //        objUser.cardCVV =     [dictCard objectForKey:@"cardCvv"];
        //        objUser.cardNum =      [dictCard objectForKey:@"cardNum"];
        //        objUser.expiryMonth =  [dictCard objectForKey:@"expiryMonth"];
        //        objUser.expiryYear =   [dictCard objectForKey:@"expiryYear"];
        //        objUser.holderName =   [dictCard objectForKey:@"holderName"];
        
        
        if ([[dic objectForKey:@"status"] isEqual:[NSNumber numberWithInt:1]])
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:[dic objectForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Information" message:[dic objectForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        
//        [self stopProgress];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        
//        [self stopProgress];
    }];
}





@end
