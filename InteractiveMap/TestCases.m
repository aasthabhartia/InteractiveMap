//
//  TestCases.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestCases.h"
#import "BuildingManager.h"
#import "Location.h"
#import "Building.h"
#import "MapResult.h"
#import "MapHelper.h"

@interface TestCases ()


@end


@implementation TestCases

-(id) initAndRun
{
    self = [super init];
    if ( self )
    {
        MapHelper *mapHelper = [MapHelper sharedInstance];
        // TODO : Very unlikely, but there is low chance that there is a race condition
        mapHelper.delegate = self;
    }
    return [super init];
}


/*- (void) receivedFirstCurrentLocation
{
    MapHelper *mapHelper = [MapHelper sharedInstance];
    // We can be sure here that current location is actually valid
    Location *currentLocation = [mapHelper getCurrentLocation];
    BuildingManager *buildingManager = [BuildingManager sharedInstance];
    
    NSLog(@"Running Test cases\n");
    
    for (Building* building in buildingManager.buildingList)
    {
        
        MapResult *mapResult = [mapHelper getResultFromLocation:currentLocation toBuilding:building];
        NSLog(@"Building (%@), time: %@, distance : %@\n",
              building.name,
              mapResult.time,
              mapResult.distance);
        sleep(6);
    }
}*/

@end