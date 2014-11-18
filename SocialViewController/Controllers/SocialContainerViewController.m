//
//  SocialContainerViewController.m
//  SocialViewController
//
//  Created by Anton Sokolchenko on 11/17/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SocialContainerViewController.h"
NSString *embedFirst = @"embedFirst"; // main screen with 'Why register?'
NSString *embedSecond = @"embedSecond"; // screen with "enter your information manually"

@interface SocialContainerViewController()

@property (nonatomic, strong) NSString *currentSegueIdentifier;
@property (nonatomic, strong) UIViewController *firstViewController;
@property (nonatomic, strong) UIViewController *secondViewController;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation SocialContainerViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = embedFirst;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:embedFirst]) {
        self.firstViewController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:embedSecond]) {
        self.secondViewController = segue.destinationViewController;
    }
    
    if( [segue.identifier isEqualToString:embedFirst] ){
        if( self.childViewControllers.count > 0 ){
            // not first time
            [self swapFromViewController:self.childViewControllers[0] toViewController:self.firstViewController];
        }
        else{
            //first time. load and initialize
            [self addChildViewController:segue.destinationViewController];
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    else if( [segue.identifier isEqualToString:embedSecond ]){
        // first view controller always swapped with second view controller
        [self swapFromViewController:self.childViewControllers[0] toViewController:self.secondViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController{
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController.view setFrame:self.containerView.bounds];
        [toViewController didMoveToParentViewController:self];
        
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers{
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:embedFirst]) ? embedSecond : embedFirst;
    
    if (([self.currentSegueIdentifier isEqualToString:embedFirst]) && self.firstViewController) {
        [self swapFromViewController:self.secondViewController toViewController:self.firstViewController];
        return;
    }
    
    if (([self.currentSegueIdentifier isEqualToString:embedSecond]) && self.secondViewController) {
        [self swapFromViewController:self.firstViewController toViewController:self.secondViewController];
        return;
    }
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

@end
