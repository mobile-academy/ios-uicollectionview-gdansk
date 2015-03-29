//
// Created by Maciej Oczko on 26/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "SpeakersViewController.h"
#import "SpeakersDataSource.h"
#import "UICollectionViewFlowLayout+SpeakersLayouts.h"

@interface SpeakersViewController () <UICollectionViewDelegateFlowLayout>
@end

@implementation SpeakersViewController

/*
    This is a view controller for managing collection view.
    It takes `SpeakersDataSource` as a dependency to provide items for collection view.

    Please follow the TODOs to complete this exercise.
    (To list TODOs in AppCode use CMD+6 shortcut.)

    HINT 1: This controller should be a collection view delegate.
    HINT 2: `SpeakersDataSource` should be a collection view data source.
 */
+ (instancetype)withDataSource:(SpeakersDataSource *)dataSource {
    return [[self alloc] initWithDataSource:dataSource];
}

- (instancetype)initWithDataSource:(SpeakersDataSource *)dataSource {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _dataSource = dataSource;
        self.title = @"Speakers";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"Speakers"]
                                                          tag:1];
    }

    return self;
}

- (void)loadView {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout speakersVerticalLayout];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                          collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    [self.dataSource bindWithCollectionView:collectionView];
    self.view = collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat margin = 20.f;
    CGFloat dimension = CGRectGetWidth(collectionView.bounds) * 0.5f - margin;
    return CGSizeMake(dimension, dimension);
}

@end
