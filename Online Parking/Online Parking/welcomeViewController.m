//
//  welcomeViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 04/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "welcomeViewController.h"

@interface welcomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *findParkingView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation welcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"111.jpg"]];
    self.findParkingView.alpha = 0.9;
    [self method];
}
-(void)method{
    //........session Variable..........
    NSString *email = [[NSUserDefaults standardUserDefaults]
                       stringForKey:@"email"];
    //..................................
    NSString *rawStr = [NSString stringWithFormat:@"user_email=%@&", email];
    NSData *data = [rawStr dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/returnUserName.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
   NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    NSDictionary *info = [json objectAtIndex:0];
    NSString *user_name = [NSString stringWithFormat:@"Welcome %@", [info objectForKey:@"name"]];
    self.labelName.text = user_name;
}

@end
