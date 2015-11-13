//
//  Building.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_Building_h
#define InteractiveMap_Building_h

#import "Location.h"

@interface Building : NSObject

@property (weak) NSString *name;
@property (weak) NSString *formattedAddress;
@property (weak) NSString *address;
@property (strong) Location *location;

- (id) initBuildingWithName:(NSString*)name andAddress:(NSString *)address andFormattedAddress: (NSString *)formattedAddress andLocation:(Location*)location;

@end



#endif
