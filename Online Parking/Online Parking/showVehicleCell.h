//
//  showVehicleCell.h
//  Online Parking
//
//  Created by Romi_Khan on 25/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showVehicleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *license_plateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *modelCell;

@end
