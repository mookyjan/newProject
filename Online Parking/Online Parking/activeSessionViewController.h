//
//  activeSessionViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 11/03/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface activeSessionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *remainingTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *reservationID;
@property (weak, nonatomic) IBOutlet UILabel *plotName;
@property (weak, nonatomic) IBOutlet UILabel *slotName;
@property (weak, nonatomic) IBOutlet UILabel *vehicle;
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *reservationDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *parkingArea;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UIButton *extendSessionButton;


@end
