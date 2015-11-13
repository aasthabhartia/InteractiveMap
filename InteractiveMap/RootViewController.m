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
#import "SamplePopupViewController.h"
#import "UIViewController+CWPopup.h"

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
    self.useBlurForPopup = YES;
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
    singleTap.numberOfTapsRequired = 2;
    singleTap.delegate = self;
    [self.southGarageButton addGestureRecognizer:singleTap];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 2;
    singleTap.delegate = self;
    [self.BBCButton addGestureRecognizer:singleTap];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 2;
    singleTap.delegate = self;
    [self.engineeringButton addGestureRecognizer:singleTap];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 2;
    singleTap.delegate = self;
    [self.kingLibraryButton addGestureRecognizer:singleTap];
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 2;
    singleTap.delegate = self;
    [self.YUHbutton addGestureRecognizer:singleTap];
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired = 2;
    singleTap.delegate = self;
    [self.studentUnionButton addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopup)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapRecognizer];

    

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
        NSString *imgName = (@"%@",building.name);
        UIImage * buildingImage = [[UIImage alloc] init ];
        buildingImage = [UIImage imageNamed:imgName];
        SamplePopupViewController *popupController = [[SamplePopupViewController alloc] initWithNibName:@"SamplePopupViewController" bundle:nil];
       [self presentPopupViewController:popupController animated:YES completion:^(void) {
            NSLog(@"popup view presented");}];
        [popupController.buildingName setTitle:building.name];
        [popupController.addressDetail setText:building.formattedAddress];
        [popupController.durationDetail setText:mapResult.time];
        [popupController.distanceDetail setText:mapResult.distance];
        [popupController.buildingImage setImage:buildingImage];
        
    }
    else
    {
        message = @"Current location is not available yet, try again later";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:building.name
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    
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

- (void)dismissPopup {
    if (self.popupViewController != nil) {
        [self dismissPopupViewControllerAnimated:YES completion:^{
            NSLog(@"popup view dismissed");
        }];
    }
}


@end




