//
//  directionViewController.h
//  Online Parking
//
//  Created by Romi_Khan on 16/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface directionViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) MKPlacemark *destination;
@property (strong,nonatomic) MKPlacemark *source;
@property double latitude;
@property double longitude;
@property NSString *destination_parking_name;

@end
