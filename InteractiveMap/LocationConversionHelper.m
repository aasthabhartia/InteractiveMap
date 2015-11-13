//
//  LocationConversionHelper.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/13/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XY.h"
#import "LocationConversionHelper.h"
#import "Location.h"


@interface LocationConversionHelper ()

@end


@implementation LocationConversionHelper

static LocationConversionHelper* sharedObj = nil;


+(LocationConversionHelper*) sharedInstance;
{
    if ( sharedObj == nil )
    {
        @synchronized( sharedObj )
        {
            if ( sharedObj == nil )
            {
                sharedObj = [[LocationConversionHelper alloc] init];
            }
        }
    }
    return sharedObj;
}


-(XY*) convertLocationToXY:(Location*)location withImageWidth:(double) imageWidth
{
    
    double x = imageWidth * (fabs(location.longitude) -121.8853334)/(121.876243 -121.8853334);
    double y = imageWidth - (imageWidth * (fabs(location.latitude)-37.331361)/(37.3376163-37.331361));
    return [[XY alloc] initWithX:x andLongitude:y];
    
}

@end