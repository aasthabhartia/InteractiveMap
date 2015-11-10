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

@interface BuildingManager : NSObject

@property NSMutableArray *buildingList;

+(BuildingManager*) sharedInstance;

@end

#endif
