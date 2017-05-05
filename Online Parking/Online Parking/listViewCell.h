//
//  listViewCell.h
//  Online Parking
//
//  Created by Romi_Khan on 09/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface listViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel1;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel2;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel3;

@end
