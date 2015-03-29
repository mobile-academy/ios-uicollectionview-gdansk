//
// Created by Maciej Oczko on 29/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "SpeakersDataSource.h"
#import "SpeakerItem.h"
#import "SpeakerCollectionViewCell.h"

@interface SpeakersDataSource () <UICollectionViewDataSource>
@property(nonatomic, copy, readwrite) NSString *cellIdentifier;
@property(nonatomic, readwrite) NSArray *speakerItems;
@property(nonatomic, readwrite) Class cellClass;
@end

@implementation SpeakersDataSource

/*
    This is a data source class meant to be collection view data source.

    The data we want to display is array of speaker items. Each speaker item contains an image.
    See: `self.speakerItems` property.
 */
- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellIdentifier = @"SpeakersCellIdentifier";
        self.cellClass = [SpeakerCollectionViewCell class];
        self.speakerItems = [self loadSpeakerItems];
    }

    return self;
}

#pragma mark - Binding

- (void)bindWithCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:self.cellClass forCellWithReuseIdentifier:self.cellIdentifier];
    collectionView.dataSource = self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.speakerItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SpeakerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier
                                                                                forIndexPath:indexPath];
    SpeakerItem *speakerItem = self.speakerItems[(NSUInteger) indexPath.item];
    cell.imageView.image = speakerItem.image;
    return cell;
}

#pragma mark - Helpers

- (NSArray *)loadSpeakerItems {
    NSArray *imagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:nil];
    NSMutableArray *speakerItems = [NSMutableArray array];
    for (NSString *path in imagePaths) {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [speakerItems addObject:[SpeakerItem itemWithImage:image]];
    }
    return speakerItems;
}

@end
