//
//  MapResult.h
//  InteractiveMap
//
//  Created by Aastha Bhartia on 11/8/15.
//  Copyright (c) 2015 Aastha Bhartia. All rights reserved.
//

#ifndef InteractiveMap_MapResult_h
#define InteractiveMap_MapResult_h

#import <Foundation/Foundation.h>

@interface MapResult : NSObject

@property int time;
@property float distance;

-(id) initWithTime:(int)time andDistance:(float)distance;

@end

#endif
