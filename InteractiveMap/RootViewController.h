//
//  RootViewController.h
//  InteractiveMap
//
//  Created by Purvi Singla on 11/10/15.
//  Copyright © 2015 Aastha Bhartia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SamplePopupViewController.h"
#import "MapHelperDelgate.h"
#import "MapHelper.h"

@interface RootViewController : UIViewController<UIGestureRecognizerDelegate,UIScrollViewDelegate,UISearchBarDelegate,MapHelperDelegate> {
        UIImageView *imageView;
    UIButton *southGarageButton;
}

@property (strong, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *southGarageButton;
@property (strong, nonatomic) IBOutlet UIButton *BBCButton;
@property (strong, nonatomic) IBOutlet UIButton *engineeringButton;
@property (strong, nonatomic) IBOutlet UIButton *kingLibraryButton;
@property (strong, nonatomic) IBOutlet UIButton *studentUnionButton;
@property (strong, nonatomic) IBOutlet UIButton *YUHbutton;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property MapHelper *mapHelper;
@property CAShapeLayer *circleLayer;


-(IBAction) btnReturn:(id) sender;

@end
