//
//  BuildingManager.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_BuildingManager_h
#define InteractiveMap_BuildingManager_h

#import <Foundation/Foundation.h>
#import "Building.h"

@interface BuildingManager : NSObject

@property (strong) NSMutableArray *buildingList;

+(BuildingManager*) sharedInstance;

-(Building*) searchBuildingWithName:(NSString*)pName;

@end

#endif
