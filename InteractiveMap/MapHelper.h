//
//  MapHelper.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_MapHelper_h
#define InteractiveMap_MapHelper_h

#import <CoreLocation/CoreLocation.h>
#import "MapHelperDelgate.h"

// forward decs
@class Location;
@class Building;
@class MapResult;
@protocol CLLocationManagerDelegate;

@interface MapHelper : NSObject <CLLocationManagerDelegate>

@property id<MapHelperDelegate> delegate;

+(MapHelper *) sharedInstance;
-(MapResult *) getResultFromLocation:(Location *)pLocation toBuilding:(Building *)pBuilding;
-(Location*) getCurrentLocation;

@end

#endif
