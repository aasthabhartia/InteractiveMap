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
static const NSString* API_KEY = @"AIzaSyDpiS8sy8Sn225n7UQjQdXb9QRGwtHc5A0";
static NSString* GOOGLE_API_URL = @"https://maps.googleapis.com/maps/api/distancematrix/json?origins=%f,%f&destinations=%@&key=%@";

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
    NSString *url = [NSString stringWithFormat:GOOGLE_API_URL,
                        pLocation.latitude,
                        pLocation.longitude,
                        pBuilding.address, API_KEY];
    
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    MapResult *result = [[MapResult alloc] init];
    NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
    [self performSelectorOnMainThread:@selector(fetchedData:)
                           withObject:@[data,result]
                        waitUntilDone:YES];
    return result;
}

-(void)fetchedData:(NSArray *)array {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:[array objectAtIndex:0]
                          
                          options:kNilOptions
                          error:&error];
    
    NSMutableString * distance = json[@"rows"][0][@"elements"][0][@"distance"][@"text"];
    NSMutableString * duration = json[@"rows"][0][@"elements"][0][@"duration"][@"text"];
    
    MapResult *result = [array objectAtIndex:1];
    result.time = duration;
    result.distance = distance;
    
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