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

@property bool hasLocation;
@property (strong) NSMutableArray *buildingList;
@property (strong) Location *currentLocation;
@property (strong) CLLocationManager *locationManager;

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
        
        self.hasLocation = false;
        self.currentLocation = [[Location alloc] initWithLatitude:0 andLongitude:0];

        [self.locationManager startUpdatingLocation];
    }
    return self;
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if ( locations.count > 0 )
    {
        CLLocation *location = [locations lastObject];
        CLLocationDegrees latitude = location.coordinate.latitude;
        CLLocationDegrees longitude = location.coordinate.longitude;
        bool hadLocation = self.hasLocation;
        @synchronized ( self )
        {
            self.currentLocation.latitude = latitude;
            self.currentLocation.longitude = longitude;
            self.hasLocation = true;
        }
        
        if ( !hadLocation && self.delegate != nil )
            [self.delegate receivedFirstCurrentLocation];
    }
    else
    {
        NSLog( @"Did not get location" );
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error%@",error);
}


-(Location*) getCurrentLocation
{
    Location *location = nil;
    @synchronized ( self )
    {
        if ( self.hasLocation )
        {
            location = [[Location alloc] initWithLatitude:self.currentLocation.latitude
                                             andLongitude:self.currentLocation.longitude];
        }
    }
    return location;
}

@end