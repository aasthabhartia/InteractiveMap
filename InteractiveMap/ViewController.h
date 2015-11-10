//
//  ViewController.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController< MKMapViewDelegate, UIScrollViewDelegate>
{
    //Map View
    MKMapView *sjsuMap;
    
}

-(IBAction)loadCampusMap:(id)sender;

@end
