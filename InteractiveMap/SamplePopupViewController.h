//
//  SamplePopupViewController.h
//  CWPopupDemo
//
//  Created by Cezary Wojcik on 8/21/13.
//  Copyright (c) 2013 Cezary Wojcik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface SamplePopupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *distanceDetail;
@property (strong, nonatomic) IBOutlet UILabel *durationDetail;
@property (strong, nonatomic) IBOutlet UINavigationItem *buildingName;
@property (strong, nonatomic) IBOutlet UIImageView *buildingImage;
@property (weak, nonatomic) IBOutlet UITextView *addressDetail;


@end
