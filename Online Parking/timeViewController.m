//
//  timeViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 22/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "timeViewController.h"

@interface timeViewController ()

@end

@implementation timeViewController{
    NSDate *startTime;
    NSDate *endTime;
    NSDate *startDate;
    NSDate *endDate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startTimePicker.hidden = YES;
    self.endTimePicker.hidden = YES;
    self.endTimePickerView.hidden = YES;
    self.startTimePickerView.hidden = YES;
}
- (IBAction)startTimeButton:(id)sender {
    self.startTimePicker.hidden = NO;
    self.endTimePickerView.hidden = NO;
}
- (IBAction)endTimeButton:(id)sender {
    self.endTimePicker.hidden = NO;
    self.startTimePickerView.hidden = NO;
}
- (IBAction)startTimeValueChanged:(id)sender {
    //........disabled past time....
    [self.startTimePicker setMinimumDate: [NSDate date]];
    //.................

    startDate = [self.startTimePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"];
    NSString *Date = [dateFormatter stringFromDate:startDate];
    startTime = startDate;
    
    //......saving Start Time
    [[NSUserDefaults standardUserDefaults]
     stringForKey:@"start_time"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:Date forKey:@"start_time"];
    [userDefault synchronize];
    //.................
    
    //.........show date value in label....
    NSDate *labelDate = [self.startTimePicker date];
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MMM d, h:mm a"];
    NSString *dateString = [df stringFromDate:labelDate];
    self.startTimeLabel.text = dateString;
    
    //saving startTimeLabel value in nsUserDefault
    NSUserDefaults *userDefault1 = [NSUserDefaults standardUserDefaults];
    [userDefault1 setObject:dateString forKey:@"startTime"];
    [userDefault1 synchronize];
}
- (IBAction)endTimeValueChanged:(id)sender {
    NSTimeInterval timeInsterval = 1*60*60;
    NSDate *time = [startDate dateByAddingTimeInterval:timeInsterval];
    [self.endTimePicker setMinimumDate: time];
    
    endDate = [self.endTimePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"];
    NSString *Date = [dateFormatter stringFromDate:endDate];
    endTime = endDate;
    //....saving end Time
    [[NSUserDefaults standardUserDefaults]
     stringForKey:@"end_time"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:Date forKey:@"end_time"];
    [userDefault synchronize];
    
    //show end time in label
    NSDate *labelDate = [self.endTimePicker date];
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MMM d, h:mm a"];
    NSString *dateString = [df stringFromDate:labelDate];
    self.endTimeLabel.text = dateString;
    
    //saving endTimeLabel value in nsUserDefault
    NSUserDefaults *userDefault1 = [NSUserDefaults standardUserDefaults];
    [userDefault1 setObject:dateString forKey:@"endTime"];
    [userDefault1 synchronize];
}

- (IBAction)saveTimeForParking:(id)sender {
    NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:startDate];
    int intTimeInterval = roundf(timeInterval/3600);
    
    //saving endTime and StartTime
    [[NSUserDefaults standardUserDefaults] integerForKey:@"activeTime"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setInteger:intTimeInterval forKey:@"activeTime"];
    [userDefault synchronize];
    //////////////////////////
    
    if ([self.endTimeLabel.text isEqualToString:@""] || [self.startTimeLabel.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Enter start and end time" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        [self performSegueWithIdentifier:@"saveTime" sender:self];
    }
}


@end
