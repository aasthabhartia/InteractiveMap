//
//  Building.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_Building_h
#define InteractiveMap_Building_h

@interface Building : NSObject

@property NSString *name;
@property NSString *address;

- (id) initBuildingWithName:(NSString*)name andAddress:(NSString *)address;

@end



#endif
