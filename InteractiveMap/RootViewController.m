//
//  RootViewController.m
//  InteractiveMap
//
//  Created by Purvi Singla on 11/10/15.
//  Copyright © 2015 Aastha Bhartia. All rights reserved.
//

#import "RootViewController.h"
@implementation RootViewController

@synthesize sjMap;


-(IBAction) btnReturn:(id) sender{
    [self dismissViewControllerAnimated:YES completion:nil ];
}

- (void)viewDidLoad {
    CGRect scrollFrame = CGRectMake(0, 20, 372, 640);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
    scrollView.minimumZoomScale = 0.1;
    scrollView.maximumZoomScale = 2.0;
    scrollView.delegate = self;
    
    UIImage *campusMap = [UIImage imageNamed:@"campusmap.jpg"];
    sjMap = [[UIImageView alloc] initWithImage:campusMap];
    
    [scrollView addSubview:sjMap];
    scrollView.contentSize = sjMap.frame.size;
    scrollView.zoomScale = 0.8;
    //    if(getScale()!=0) {
    //        scrollView.zoomScale = getScale();
    //    }
    //    else{
    //        scrollView.zoomScale = 0.8;
    //    }
    CGFloat tempx = sjMap.center.x - (scrollView.bounds.size.width/2);
    CGFloat tempy = sjMap.center.y - (scrollView.bounds.size.height/2);
    CGPoint myScrollViewOffset = CGPointMake( tempx, tempy);
    scrollView.contentOffset = myScrollViewOffset;
    
    [self.view addSubview:scrollView];
    [scrollView release];
    [super viewDidLoad];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return sjMap;
}

- (void)dealloc {
    [super dealloc];
    [sjMap release];
}

@end


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


