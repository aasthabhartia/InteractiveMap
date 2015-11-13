//
//  XY.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/13/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_XY_h
#define InteractiveMap_XY_h

#import <Foundation/Foundation.h>

@interface XY : NSObject

@property double x;
@property double y;

- (id) initWithX:(double)pX andLongitude:(double)pY;

@end

#endif

