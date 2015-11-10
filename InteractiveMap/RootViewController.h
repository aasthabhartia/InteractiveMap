//
//  RootViewController.h
//  InteractiveMap
//
//  Created by Purvi Singla on 11/10/15.
//  Copyright © 2015 Aastha Bhartia. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UIScrollViewDelegate> {
    UIImageView *sjMap;
}

@property (retain, nonatomic) IBOutlet UIImageView *sjMap;




-(IBAction) btnReturn:(id) sender;

@end
