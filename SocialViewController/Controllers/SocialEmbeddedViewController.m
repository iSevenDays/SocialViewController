//
//  SocialEmbeddedViewController.m
//  SocialViewController
//
//  Created by Anton Sokolchenko on 11/17/14.
//  Copyright (c) 2014 AntonSokolchenko. All rights reserved.
//

#import "SocialEmbeddedViewController.h"
#import "SocialContainerViewController.h"

@interface SocialEmbeddedViewController()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation SocialEmbeddedViewController


#pragma mark - Collection View delegate methods
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}

#pragma mark - Container delegate methods
- (IBAction)swapViewController:(id)sender{
    if( self.parentViewController && [self.parentViewController isKindOfClass:[SocialContainerViewController class]] ){
        SocialContainerViewController *container = (SocialContainerViewController *)self.parentViewController;
        [container swapViewControllers];
    }
}

@end
