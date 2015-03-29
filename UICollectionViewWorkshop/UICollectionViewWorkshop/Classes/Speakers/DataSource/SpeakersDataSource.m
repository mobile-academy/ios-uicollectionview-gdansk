//
// Created by Maciej Oczko on 29/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "SpeakersDataSource.h"
#import "SpeakerItem.h"
#import "SpeakerCollectionViewCell.h"

@interface SpeakersDataSource ()
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
    // TODO 2. To bind collection view with data source, you have to do the following:
    // - Register cell class for identifier. (HINT: they are provided in `-init`)
    // - Set itself as a collection view data source. (HINT: Remember to add protocol in class header)
}

#pragma mark - UICollectionViewDataSource

// TODO 3. There are 2 required methods of UICollectionViewDataSource you need to implement
// - `-collectionView:numberOfItemsInSection:`
// - `-collectionView:cellForItemAtIndexPath:` (HINT: The cell that is returned must be retrieved from a call to `-dequeueReusableCellWithReuseIdentifier:forIndexPath:`)

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
