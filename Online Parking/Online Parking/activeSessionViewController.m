//
//  activeSessionViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 11/03/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "activeSessionViewController.h"

@interface activeSessionViewController ()

@end

@implementation activeSessionViewController{
    int remainingTime;
    NSDictionary *info;
    NSTimer *timer;
    NSDate* startDateFromString;
    NSDate* endDateFromString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchingDataFromServer];
}

- (IBAction)refreshButton:(id)sender {
    if ([startDateFromString compare:[NSDate date]] == NSOrderedDescending) {
        [self fetchingDataFromServer];
    }
    static int increment = 0;
    if (([startDateFromString compare:[NSDate date]] == NSOrderedAscending) &&
        [self.remainingTimeLAbel.text isEqualToString:@"00:00:00"] && increment == 0) {
        [self fetchingDataFromServer];
        ++increment;
    }
}

-(void)fetchingDataFromServer{
    //session Variable
    NSString *email = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    NSString *emailString = [NSString stringWithFormat:@"user_email=%@", email];
    NSData *data = [emailString dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/activesession.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPBody:data];
    [request setHTTPMethod:@"POST"];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSString *responseString = [NSString stringWithUTF8String:[responseData bytes]];
    if ([responseString isEqualToString:@"NO"]) {
        self.remainingTimeLAbel.hidden = YES;
        self.reservationID.hidden = YES;
        self.slotName.hidden = YES;
        self.plotName.hidden = YES;
        self.startTime.hidden = YES;
        self.endTime.hidden = YES;
        self.vehicle.hidden = YES;
        self.remainingLabel.hidden = YES;
        self.secondLabel.hidden = YES;
        self.minuteLabel.hidden = YES;
        self.hourLabel.hidden = YES;
        self.reservationDetailLabel.hidden = YES;
        self.label1.hidden = YES;
        self.label2.hidden = YES;
        self.label3.hidden = YES;
        self.label4.hidden = YES;
        self.label5.hidden = YES;
        self.label6.hidden = YES;
        self.label7.hidden = YES;
        self.parkingArea.hidden = YES;
        self.messageLabel.hidden = NO;
        self.extendSessionButton.hidden = YES;
    }
    else{
        info = [json objectAtIndex:0];
        self.reservationID.text = [info objectForKey:@"reservation_id"];
        self.parkingArea.text = [info objectForKey:@"name"];
        self.plotName.text = [info objectForKey:@"plot_name"];
        self.slotName.text = [info objectForKey:@"parkingslot_name"];
        self.vehicle.text = [info objectForKey:@"license_plate_no"];
        self.startTime.text = [info objectForKey:@"start_time"];
        self.endTime.text = [info objectForKey:@"end_time"];
    }
    
    NSString *startDate = [info objectForKey:@"start_time"];
    NSDateFormatter* startfmt = [NSDateFormatter new];
    [startfmt setTimeZone:[NSTimeZone defaultTimeZone]];
    [startfmt setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    startDateFromString = [startfmt dateFromString:startDate];
    
    NSString *endDate = [info objectForKey:@"end_time"];
    NSDateFormatter* endfmt = [[NSDateFormatter alloc]init];
    [endfmt setTimeZone:[NSTimeZone defaultTimeZone]];
    [endfmt setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    endDateFromString = [endfmt dateFromString:endDate];
    if ([startDateFromString compare:[NSDate date]] == NSOrderedAscending) {
        remainingTime = [endDateFromString timeIntervalSinceDate:[NSDate date]];
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownTimer) userInfo:nil repeats:YES];
    }
    
    //...................localNotification.....................//
    
    //Notification Fire Date
    NSDate *fireDate = [endDateFromString dateByAddingTimeInterval:-60*15];
    //................
    
    //notify user 15minute before the reservation expire
    UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *userSetting = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:userSetting];
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = fireDate;
    localNotification.alertBody = @"your reservation time is about to expire in 15 minute";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //notify user after when reservation time is start.
    UILocalNotification *startTimelocalNotification = [[UILocalNotification alloc]init];
    startTimelocalNotification.fireDate = startDateFromString;
    startTimelocalNotification.alertBody = [NSString stringWithFormat:@"your reservation time is started in %@", [info objectForKey:@"name"]];
    startTimelocalNotification.soundName = UILocalNotificationDefaultSoundName;
    startTimelocalNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:startTimelocalNotification];
    
    //notify user when reservation time is over.
    UILocalNotification *endTimelocalNotification = [[UILocalNotification alloc]init];
    endTimelocalNotification.fireDate = endDateFromString;
    endTimelocalNotification.alertBody = @"your reservation time is over";
    endTimelocalNotification.soundName = UILocalNotificationDefaultSoundName;
    endTimelocalNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:endTimelocalNotification];
}

-(void)countDownTimer{
    
    --remainingTime;
    int seconds = remainingTime % 60;
    int minutes = (remainingTime / 60) % 60;
    int hours = remainingTime / 3600;
    NSString *remainingTimeString = [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
    if (remainingTime < 0) {
        self.remainingTimeLAbel.text = @"00:00:00";
        [timer invalidate];
    }
    else{
    self.remainingTimeLAbel.text = remainingTimeString;
    }
}
@end
