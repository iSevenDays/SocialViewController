//
//  SocialContainerViewController.h
//  SocialViewController
//
//  Created by Anton Sokolchenko on 11/17/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialContainerViewController : UIViewController

- (void)swapViewControllers;

@property(nonatomic, assign) BOOL transitionInProgress;

@end
