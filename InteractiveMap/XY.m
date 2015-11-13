//
//  XY.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/13/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XY.h"
#import <Foundation/Foundation.h>

@interface XY ()


@end

@implementation XY

- (id) initWithX:(double)pX andLongitude:(double)pY;

{
    self = [super init];
    
    if ( self )
    {
        self.x = pX;
        self.y = pY;
    }
    
    return self;
}


@end
