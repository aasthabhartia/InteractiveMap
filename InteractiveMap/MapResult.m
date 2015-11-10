//
//  MapResult.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapResult.h"

@interface MapResult ()

@end


@implementation MapResult

-(id) initWithTime:(int)pTime andDistance:(float)pDistance;
{
    self = [super init];
    
    if ( self )
    {
        self.time = pTime;
        self.distance = pDistance;
    }
    
    return self;
}


@end