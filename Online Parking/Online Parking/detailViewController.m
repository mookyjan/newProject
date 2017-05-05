//
//  detailViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 11/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "detailViewController.h"
#import "directionViewController.h"
@interface detailViewController ()


@end

@implementation detailViewController{
    double latitude;
    double longitude;
    NSString *parking_area_name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"Parking Detail";
    
    //scrollView
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(320, 774)];
    
    NSDictionary *dic = (NSDictionary *)self.parkingAreaDetail;
    NSString *priceStr = [dic objectForKey:@"parking_fee"];
    self.priceLabel.text = [NSString stringWithFormat:@"$%@",priceStr];
    self.nameLabel.text = [dic objectForKey:@"name"];
    self.addressLabel.text = [dic objectForKey:@"area_address"];
    self.descriptionLabel.text = [dic objectForKey:@"description"];
    self.priceLabel1.text = [NSString stringWithFormat:@"$%@", [dic objectForKey:@"parking_fee"]];
    //imageView
    NSString *imageUrl =@"http://localhost/parkme/images/";
    NSString *imageStr = [dic objectForKey:@"image"];
    UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: [imageUrl stringByAppendingString:imageStr]]]];
    self.imageView.image = image;
    self.imageView.layer.borderWidth = 2;
    
///getting values of latitude and longitude
    latitude = [[dic objectForKey:@"latitude"] doubleValue];
    longitude = [[dic objectForKey:@"longitude"] doubleValue];
    parking_area_name = [dic objectForKey:@"name"];
//.........saving id, name and price of parking area in userdefault
    [[NSUserDefaults standardUserDefaults] stringForKey:@"parkingarea_id"];
    [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
    //[[NSUserDefaults standardUserDefaults] stringForKey:@"parking_fee"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:[dic objectForKey:@"id"] forKey:@"parkingarea_id"];
    [userDefault setObject:self.nameLabel.text forKey:@"name"];
    //[userDefault setObject:self.priceLabel.text forKey:@"parking_fee"];
    [userDefault synchronize];
//...................
    
    
    //''''''''''''''''''''''''
    int price = [[dic objectForKey:@"parking_fee"] intValue];
    [[NSUserDefaults standardUserDefaults] integerForKey:@"parking_fee"];
    [userDefault setInteger:price forKey:@"parking_fee"];
    //''''''''''''''''''''''''
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"directionSegue"]) {
        directionViewController *destinationVC = [segue destinationViewController];
        destinationVC.latitude = latitude;
        destinationVC.longitude = longitude;
        destinationVC.destination_parking_name = parking_area_name;
    }
}
@end
