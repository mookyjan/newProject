//
//  showVehicleViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 19/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showVehicleViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
