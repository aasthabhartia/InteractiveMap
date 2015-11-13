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
    //double x = (imageWidth * (121.88597 - fabs(location.longitude) ))/( 0.00925);
    //double y = imageWidth - (imageWidth * (fabs(location.latitude)-37.33161)/(0.00703));

    
    double x = (imageWidth * (121.886478 - fabs(location.longitude)))/( 0.010235);
    double y = imageWidth - (imageWidth * (fabs(location.latitude)-37.3316147)/(0.0070349));
    return [[XY alloc] initWithX:x andLongitude:y];
    
}

@end