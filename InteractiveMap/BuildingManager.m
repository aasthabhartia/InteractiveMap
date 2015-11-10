//
//  BuildingManager.m
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuildingManager.h"
#import "Building.h"

@interface BuildingManager ()

@end


@implementation BuildingManager

static BuildingManager* sharedObj = nil;

+(BuildingManager*) sharedInstance;
{
    if ( sharedObj == nil )
    {
        @synchronized( sharedObj )
        {
            if ( sharedObj == nil )
            {
                sharedObj = [[BuildingManager alloc] init];
            }
        }
    }
    return sharedObj;
}

-(id) init
{
    self = [super init];
    
    if ( self )
    {
        self.buildingList = [[NSMutableArray alloc] init];
        
        Building *kingLibrary = [[Building alloc] initBuildingWithName:@"King+Library"
                                                            andAddress:@"Dr.+Martin+Luther+King,+Jr.+Library,+150+East+San+Fernando+Street,+San+Jose,+CA+95112"];
        
        /*Building *engineeringBuilding = [[Building alloc] initBuildingWithName:@"Engineering+Building"
                                                                    andAddress:@"San+José+State+University+Charles+W.+Davidson+College+of+Engineering,+1+Washington+Square,+San+Jose,+CA+95112"];
        
        */
        // TODO : Add the rest of the buildings
        
        
        [self.buildingList addObject:kingLibrary];
       // [self.buildingList addObject:engineeringBuilding];
        
        // TODO : Add the rest of the buildings to the list
    }
    
    return self;
}


@end