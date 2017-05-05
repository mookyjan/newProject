//
//  confirmOrderViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 24/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIOPaymentViewControllerDelegate.h"


@interface confirmOrderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *parkingNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *licenseLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *convenienceFeeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalFee;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@end
