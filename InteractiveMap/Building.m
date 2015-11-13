//
//  Building.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Building.h"

@interface Building ()

//TODO : Add Image property


@end


@implementation Building

- (id) initBuildingWithName:(NSString*)pName andAddress:(NSString *)pAddress andFormattedAddress: (NSString *)pformattedAddress;

{
    self = [super init];
    
    if ( self )
    {
        self.name = pName;
        self.address = pAddress;
        self.formattedAddress = pformattedAddress;
    }
    
    return self;
}


@end
