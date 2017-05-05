//
//  mapViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 06/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//https://www.devfright.com/mkpointannotation-tutorial/
#import "mapViewController.h"

@interface mapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

#define the_span 0.4f;
@implementation mapViewController{
    CLLocationManager *mgr;
    NSMutableArray *json;
    NSDictionary *info;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //user authorization
    mgr = [[CLLocationManager alloc]init];
    [mgr requestWhenInUseAuthorization];
    //searchBar in navigationBar
    self.navigationItem.titleView = self.searchBar;
    //
    self.mapView.delegate = self;
    self.searchBar.delegate =self;
    
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    self.mapView.showsUserLocation = YES;
    self.mapView.centerCoordinate = userLocation.location.coordinate;

}
-(void)viewDidAppear:(BOOL)animated{
    [self mapAnnotationMethod];
}

-(void)mapAnnotationMethod{
    //connection to database
    NSURL *url = [NSURL URLWithString:@"http://localhost/parkme/getParkingAreaDetail.php"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    for (int i = 0; i < [json count]; i++) {
        
    info = [json objectAtIndex:i];
    CLLocationCoordinate2D location;
    location.latitude = [[info objectForKey:@"latitude"] doubleValue];
    location.longitude = [[info objectForKey:@"longitude"] doubleValue];
    CLLocation *userLocation = [[CLLocation alloc] initWithLatitude:34.192228 longitude:72.071734];
    CLLocation *destination = [[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
    CLLocationDistance distance = [userLocation distanceFromLocation:destination];
        //NSLog(@"%f", distance/1000);
    MKCoordinateSpan span;
    span.latitudeDelta = the_span;
    span.longitudeDelta = the_span;
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    [self.mapView setRegion:region animated:YES];
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = location;
    point.title = [info objectForKey:@"name"];
    point.subtitle = [NSString stringWithFormat:@"(%.01f km away)", distance/1000];
    [self.mapView addAnnotation:point];
    }
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"Annotation"];
            //pinView.calloutOffset = CGPointMake(0, 32);
            
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectAnnotation.png"]];
            pinView.leftCalloutAccessoryView = iconView;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}
 /*
-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    for (id<MKAnnotation> annotation in mapView.annotations) {
        MKAnnotationView *annotationView = [mapView viewForAnnotation:annotation];
        if (annotationView) {
            annotationView.image = [UIImage imageNamed:@"unselectedAnnotation.png"];
        }
    }
    view.image = [UIImage imageNamed:@"selectAnnotation.png"];
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"cell" sender:view];
}
*/

//userLocation

//searchBar delegate method
/*
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    MKLocalSearchRequest *localSearchRequest = [[MKLocalSearchRequest alloc]init];
    localSearchRequest.naturalLanguageQuery = searchBar.text;
    localSearchRequest.region = self.mapView.region;
    MKLocalSearch *localSearch = [[MKLocalSearch alloc]initWithRequest:localSearchRequest];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        NSMutableArray *searchArray = [[NSMutableArray alloc]init];
        for (MKMapItem *item in response.mapItems) {
            [searchArray addObject:item.placemark];

        }
        [self.mapView removeAnnotations:[self.mapView annotations]];
        [self.mapView showAnnotations:searchArray animated:YES];
        
    }];
}*/

@end
