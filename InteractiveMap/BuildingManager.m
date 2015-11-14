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
#import "Location.h"

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
        
        Building *kingLibrary = [[Building alloc]
                                                            initBuildingWithName:@"King Library"
                                                            andAddress:@"Dr.+Martin+Luther+King,+Jr.+Library,+150+East+San+Fernando+Street,+San+Jose,+CA+95112"
                                                            andFormattedAddress:@"Dr. Martin+Luther King, Jr. Library, 150 East San Fernando Street, San+Jose, CA 95112"
                                 andLocation:[[Location alloc] initWithLatitude:37.3358071 andLongitude:-121.885850]];
        
        
        Building *engineeringBuilding = [[Building alloc] initBuildingWithName:@"Engineering Building"
                                                                    andAddress:@"San+Jose+State+University+Charles+W.+Davidson+College+of+Engineering,+1+Washington+Square,+San+Jose,+CA+95112"
                                                                    andFormattedAddress:@"San Jose State University Charles W. Davidson College of Engineering, 1 Washington Square, San Jose, CA 95112"
                                         andLocation:[[Location alloc] initWithLatitude:37.3365666 andLongitude:-121.881843]];
        
        
        
        Building *uchidaHall = [[Building alloc] initBuildingWithName:@"Yoshihiro Uchida Hall"
                                                           andAddress:@"Yoshihiro+Uchida+Hall,+San+Jose,+CA+95112"
                                                           andFormattedAddress:@"Yoshihiro Uchida Hall, San Jose, CA 95112"
                                                           andLocation:[[Location alloc] initWithLatitude:37.33377 andLongitude:-121.884400]];
        
        
        
        Building *studentUnion = [[Building alloc] initBuildingWithName:@"Student Union"
                                                             andAddress:@"Student+Union+Building,+San+Jose,+CA+95112"
                                                             andFormattedAddress:@"Student Union Building, San Jose, CA 95112"
                                                            andLocation:[[Location alloc] initWithLatitude:37.3367305
                                                                                                andLongitude:-121.8804744]];
        
        
        
        Building *bbc = [[Building alloc] initBuildingWithName:@"BBC"
                                                    andAddress:@"Boccardo+Business+Complex,+San+Jose,+CA+95112"
                                                    andFormattedAddress:@"Boccardo Business Complex, San Jose, CA 95112"
                                                            andLocation:[[Location alloc] initWithLatitude:37.3366
                                                                andLongitude:-121.8756652]];

        
        Building *southParkingGarage = [[Building alloc] initBuildingWithName:@"South Parking Garage"
                                                                   andAddress:@"San+Jose+State+University+South+Garage,+330+South+7th+Street,+San+Jose,+CA+95112"
                                        andFormattedAddress:@"San Jose State University South Garage, 330 South 7th Street, San Jose, CA 95112"
                                                        andLocation:[[Location alloc] initWithLatitude:37.3335099
                                                                                          andLongitude:-121.8807696]];
        
        [self.buildingList addObject:kingLibrary];
        [self.buildingList addObject:engineeringBuilding];
        [self.buildingList addObject:uchidaHall];
        [self.buildingList addObject:bbc];
        [self.buildingList addObject:studentUnion];
        [self.buildingList addObject:southParkingGarage];
        
    }
    
    return self;
}

-(Building*) searchBuildingWithName:(NSString*)pName
{
    for (Building* building in self.buildingList)
    {
        if ([building.name isEqualToString:pName])
        {
            return building;
        }
    }
    return nil;

}


@end