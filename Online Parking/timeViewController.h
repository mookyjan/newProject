//
//  timeViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 22/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface timeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *endTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *startTimePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endTimePicker;
@property (weak, nonatomic) IBOutlet UIView *endTimePickerView;//opposite name
@property (weak, nonatomic) IBOutlet UIView *startTimePickerView;

@end
