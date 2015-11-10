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

-(id) initWithTime:(NSString*)pTime andDistance:(NSString*)pDistance
{
    self = [super init];
    
    if ( self )
    {
        self.time = pTime;
        self.distance = pDistance;
    }
    
    return self;
}

-(id) init
{
    self = [super init];
    
    if ( self )
    {
        self.time = nil;
        self.distance = nil;
    }
    
    return self;
}

@end