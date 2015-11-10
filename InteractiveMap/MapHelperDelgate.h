//
//  MapHelperDelgate.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_MapHelperDelgate_h
#define InteractiveMap_MapHelperDelgate_h

@protocol MapHelperDelegate <NSObject>
- (void) receivedFirstCurrentLocation;
@end

#endif
