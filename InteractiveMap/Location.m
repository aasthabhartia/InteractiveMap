//
//  Location.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import "Location.h"
#import <Foundation/Foundation.h>

@interface Location ()

@property double latitude;
@property double longitude;

@end


@implementation Location

- (id) initWithLatitude:(double)pLatitude andLongitude:(double)pLongitude
{
    self = [super init];
    
    if ( self )
    {
        self.latitude = pLatitude;
        self.longitude = pLongitude;
    }
    
    return self;
}


@end
