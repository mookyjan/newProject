//
//  showVehicleViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 19/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import "showVehicleViewController.h"
#import "showVehicleCell.h"
#import "Toast.h"
@interface showVehicleViewController ()

@end

@implementation showVehicleViewController{
    NSData *responseData;
    NSMutableArray *json;
    NSMutableDictionary *info;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    [self serverData];
   // [self method1];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    if ([json count] == 0) {
        self.tableView.hidden = YES;
    }
}
-(void)serverData{
    //.....................session variable........
    NSString *email = [[NSUserDefaults standardUserDefaults]
                       stringForKey:@"email"];
    //....................................
    NSString *rawStr = [NSString stringWithFormat:@"user_email=%@&", email];
    NSData *data = [rawStr dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/showVehicle.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    NSURLResponse *response;
    NSError *err;
    responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSError *error;
    
    json = [[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error ] mutableCopy];
}
/*-(void)method1{
    
    for (NSMutableArray *array in json) {
        NSDictionary *info = (NSDictionary *)array;
        NSLog(@"%@", [info objectForKey:@"license_plate_no"]);
    }
}*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [json count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    showVehicleCell *cell = (showVehicleCell *)[self.tableView dequeueReusableCellWithIdentifier:@"cell_identifier"];
    if(cell == nil)
    {
        [tableView dequeueReusableCellWithIdentifier:@"cell_identifier" forIndexPath:indexPath];
    }
    //info = [json objectAtIndex:indexPath.row];
    cell.license_plateLabel.text = [NSString stringWithFormat:@"%@", [[json objectAtIndex:indexPath.row] objectForKey:@"license_plate_no"]];
    cell.modelCell.text = [NSString stringWithFormat:@"%@", [[json objectAtIndex:indexPath.row] objectForKey:@"model"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //info = [json objectAtIndex:indexPath.row];
    NSString *license_plate_no = [[json objectAtIndex:indexPath.row]objectForKey:@"license_plate_no"];
    
    //saving plate_no
    [[NSUserDefaults standardUserDefaults]
     stringForKey:@"license"];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:license_plate_no forKey:@"license"];
    [userDefault synchronize];
    }


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSMutableDictionary *dic = [json objectAtIndex:indexPath.row];
    NSString *license_plate_no =  [[json objectAtIndex:indexPath.row]objectForKey:@"license_plate_no"];
    NSString *str = [NSString stringWithFormat:@"license_plate_no=%@&", license_plate_no];
    NSData *data1 = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url1 = [NSURL URLWithString:@"http://localhost/parkme/deleteVehicle.php"];
    NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:url1];
    [request1 setHTTPMethod:@"POST"];
    [request1 setHTTPBody:data1];
    NSURLResponse *response1;
    NSError *error;
    NSData *responseData1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:&response1 error:&error];
    NSString *responseString1 = [NSString stringWithUTF8String:[responseData1 bytes]];
    if ([responseString1 isEqualToString:@"Yes"]) {
       [json removeObjectAtIndex:indexPath.row];
        [Toast showToastWithMessage:[NSString stringWithFormat:@"you have successfully deleted your car"] forDuration:3];
        [self.tableView reloadData];
    }
}
@end
