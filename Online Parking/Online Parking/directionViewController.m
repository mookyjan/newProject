//
//  directionViewController.m
//  Online Parking
//
//  Created by Romi_Khan on 16/02/2017.
//  Copyright © 2017 SoftBrain. All rights reserved.
//
// location1: 37.773972, -122.431297;
// location2: 37.615223, -122.389977;

#import "directionViewController.h"

@interface directionViewController ()

@end

@implementation directionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    [self getDirections];
}
-(void)getDirections {
    
    CLLocationCoordinate2D sourceCoords = CLLocationCoordinate2DMake(34.192228, 72.071734);
    
    MKCoordinateRegion region;
    //Set Zoom level using Span
    MKCoordinateSpan span;
    region.center = sourceCoords;
    
    span.latitudeDelta = 1;
    span.longitudeDelta = 1;
    region.span=span;
    [self.mapView setRegion:region animated:TRUE];
    
    MKPlacemark *placemark  = [[MKPlacemark alloc] initWithCoordinate:sourceCoords addressDictionary:nil];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = sourceCoords;
    annotation.title = @"user location";
    [self.mapView addAnnotation:annotation];
    //[self.myMapView addAnnotation:placemark];
    
    self.destination = placemark;
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:self.destination];
    
    CLLocationCoordinate2D destCoords = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    MKPlacemark *placemark1  = [[MKPlacemark alloc] initWithCoordinate:destCoords addressDictionary:nil];
    
    MKPointAnnotation *annotation1 = [[MKPointAnnotation alloc] init];
    annotation1.coordinate = destCoords;
    annotation1.title = self.destination_parking_name;
    [self.mapView addAnnotation:annotation1];
    
    //[self.myMapView addAnnotation:placemark1];
    
    self.source = placemark1;
    
    MKMapItem *mapItem1 = [[MKMapItem alloc] initWithPlacemark:self.source];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = mapItem1;
    
    request.destination = mapItem;
    request.requestsAlternateRoutes = YES;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         if (error) {
             NSLog(@"%@",[error localizedDescription]);
         } else {
             [self showRoute:response];
         }
     }];
}

-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes)
    {
        [self.mapView
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
       /* for (MKRouteStep *step in route.steps)
        {
            NSLog(@"%@", step.instructions);
        }*/
    }
}

#pragma mark - MKMapViewDelegate methods

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor colorWithRed:0.0/255.0 green:171.0/255.0 blue:253.0/255.0 alpha:1.0];
    renderer.lineWidth = 10.0;
    return  renderer;
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        MKAnnotationView *annotationView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"reuse_identifier"];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"reuse_identifier"];
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"selectAnnotation.png"];
            annotationView.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selectAnnotation"]];
        }
        else{
            annotationView.annotation = annotation;
        }
        return annotationView;
    }
    return nil;
}
@end
