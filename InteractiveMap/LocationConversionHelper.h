//
//  LocationConversionHelper.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/13/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_LocationConversionHelper_h
#define InteractiveMap_LocationConversionHelper_h

@class Location;
@class XY;

#import "Location.h"
#import "XY.h"

@interface LocationConversionHelper : NSObject

+(LocationConversionHelper*) sharedInstance;

-(XY*) convertLocationToXY:(Location*)location withImageWidth:(double) imageWidth;

@end

#endif
