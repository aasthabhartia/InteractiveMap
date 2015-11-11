//
//  RootViewController.m
//  InteractiveMap
//
//  Created by Purvi Singla on 11/10/15.
//  Copyright © 2015 Aastha Bhartia. All rights reserved.
//


#import "RootViewController.h"
#import "BuildingManager.h"
#import "Building.h"
#import "Location.h"
#import "MapHelper.h"
#import "MapResult.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize imageView;
@synthesize subView;
@synthesize scrollView;
@synthesize southGarageButton;
@synthesize engineeringButton;
@synthesize BBCButton;
@synthesize kingLibraryButton;
@synthesize YUHbutton;
@synthesize studentUnionButton;
@synthesize searchBar;

-(IBAction) btnReturn:(id) sender{
    [self dismissViewControllerAnimated:YES completion:nil ];
}

- (void)viewDidLoad {

    // just to get the current location fetch started
    MapHelper *mapHelper = [MapHelper sharedInstance];
    [mapHelper getCurrentLocation];

    //CGRect scrollFrame = CGRectMake(0, 20, 600, 800);
    
    //[scrollView setFrame:scrollFrame];
    //[scrollView setMinimumZoomScale:0.1];
    //[scrollView setMaximumZoomScale:2.0];
    scrollView.delegate = self;
    searchBar.delegate = self;
    //scrollView.contentSize = imageView.frame.size;
    //scrollView.zoomScale = 0.8;
    //    if(getScale()!=0) {
    //        scrollView.zoomScale = getScale();
    //    }
    //    else{
    //        scrollView.zoomScale = 0.8;
    //    }
    //CGFloat tempx = imageView.center.x - (scrollView.bounds.size.width/2);
    //CGFloat tempy = imageView.center.y - (scrollView.bounds.size.height/2);
    //CGPoint myScrollViewOffset = CGPointMake( tempx, tempy);
    //scrollView.contentOffset = myScrollViewOffset;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [self.southGarageButton addGestureRecognizer:singleTap];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [self.BBCButton addGestureRecognizer:singleTap];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [self.engineeringButton addGestureRecognizer:singleTap];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [self.kingLibraryButton addGestureRecognizer:singleTap];
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [self.YUHbutton addGestureRecognizer:singleTap];
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [self.studentUnionButton addGestureRecognizer:singleTap];

    [super viewDidLoad];
    
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    
    UIButton *myButton = (UIButton *)recognizer.view;
    MapHelper *mapHelper = [MapHelper sharedInstance];
    Location *currentLocation = [mapHelper getCurrentLocation];
    BuildingManager *buildingManager = [BuildingManager sharedInstance];
    Building *building = [buildingManager searchBuildingWithName:myButton.titleLabel.text];
    MapResult *mapResult = [mapHelper getResultFromLocation:currentLocation
                                                 toBuilding:building];
    
    NSString *message;
    
    if ( currentLocation != nil )
    {
        message = [NSString stringWithFormat:@"Distance: %@, Time: %@",
                                            mapResult.distance,
                                            mapResult.time];
    }
    else
    {
        message = @"Current location is not available yet, try again later";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:building.name
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)sView
{
    CGFloat offsetX = MAX((sView.bounds.size.width - sView.contentSize.width) * 0.5, 0.0);
    CGFloat offsetY = MAX((sView.bounds.size.height - sView.contentSize.height) * 0.5, 0.0);
    
    subView.center = CGPointMake(sView.contentSize.width * 0.5 + offsetX,
                                 sView.contentSize.height * 0.5 + offsetY);

    return subView;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    BuildingManager *buildingManager = [BuildingManager sharedInstance];
    Building *building = [buildingManager searchBuildingWithName:searchBar.text];
    if (building!=nil)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:building.name
                                                        message:@"Need to zoom into building"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Search Result"
                                                        message:@"Building Not found!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
}

@end




