//
//  MapHelper.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MapHelper.h"
#import "MapResult.h"
#import "Building.h"
#import "Location.h"

@interface MapHelper ()

@property NSMutableArray *buildingList;

@property CLLocation *currentLocation;
@property CLLocationManager *locationManager;

@end


@implementation MapHelper

static MapHelper* sharedObj = nil;

+(MapHelper*) sharedInstance;
{
    if ( sharedObj == nil )
    {
        @synchronized( sharedObj )
        {
            if ( sharedObj == nil )
            {
                sharedObj = [[MapHelper alloc] init];
            }
        }
    }
    return sharedObj;
}

-(MapResult *) getResultFromLocation:(Location *)pLocation toBuilding:(Building *)pBuilding
{
    int time = 5;
    float distance = 500;
    //https://maps.googleapis.com/maps/api/distancematrix/json?origins=Vancouver+BC|Seattle&destinations=San+Francisco|Victoria+BC&mode=bicycling&language=fr-FR&key=YOUR_API_KEY
    NSString *startAddress = @"San+Jose+State+University+South+Garage,+330+South+7th+Street,+San+Jose,+95112";
   NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/distancematrix/json?origins=%@&destinations=%@&key=AIzaSyDpiS8sy8Sn225n7UQjQdXb9QRGwtHc5A0", startAddress, pBuilding.address];
    
    /*NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/distancematrix/json?origins=Darling+Harbour+NSW+Australia&destinations=Bobcaygeon+ON&key=AIzaSyDpiS8sy8Sn225n7UQjQdXb9QRGwtHc5A0"];*/
   
    
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
  
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    
    
    // TODO : Connect to Google API and get this for reals
    
    return [[MapResult alloc] initWithTime:time andDistance:distance];
}

-(void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"rows.elements.distance.value"];
    
    //Write out the data to the console.
    NSLog(@"Google Data: %@", places);
}


-(id) init
{
    self = [super init];
    if ( self )
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        
        if ( ![self.locationManager locationServicesEnabled] )
        {
            NSLog(@"Location Services Disabled");
        }
        
        [self.locationManager requestWhenInUseAuthorization];
        
        self.currentLocation = nil;

        [self.locationManager startUpdatingLocation];
    }
    return self;
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    @synchronized ( self.currentLocation )
    {
        if ( self.currentLocation == nil && self.delegate != nil )
        {
             self.currentLocation = [locations lastObject];
            [self.delegate receivedFirstCurrentLocation];
        }
        else
        {
            self.currentLocation = [locations lastObject];
        }
        
        
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error%@",error);
}


-(Location*) getCurrentLocation
{
    if ( self.currentLocation == nil )
    {
        // TODO : Deal with the fact that current location is not ready
        // return a nil and handle with popup saying please wait
        return [[Location alloc] initWithLatitude:0 andLongitude:0];
    }
    
    CLLocationDegrees latitude = self.currentLocation.coordinate.latitude;
    CLLocationDegrees longitude = self.currentLocation.coordinate.longitude;
    
    return [[Location alloc] initWithLatitude:latitude andLongitude:longitude];
}

@end