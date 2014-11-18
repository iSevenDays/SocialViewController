//
//  SocialSecondViewController.m
//  SocialViewController
//
//  Created by Anton Sokolchenko on 11/17/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SocialSecondViewController.h"
#import "SocialContainerViewController.h"

@implementation SocialSecondViewController

- (IBAction)swapViewController:(id)sender{
    if( self.parentViewController && [self.parentViewController isKindOfClass:[SocialContainerViewController class]] ){
        SocialContainerViewController *container = (SocialContainerViewController *)self.parentViewController;
        [container swapViewControllers];
    }
}

@end
