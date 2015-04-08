//
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "StreamItemPreviewLayout.h"
#import "PhotoStreamLayout.h"

@interface StreamItemPreviewLayout ()
@property(nonatomic, strong) NSMutableArray *layoutAttributes;
@property(nonatomic, assign) CGSize itemSize;
@end

@implementation StreamItemPreviewLayout

#pragma mark - Layout hooks

- (void)prepareLayout {
    self.itemSize = self.collectionView.bounds.size;
    self.layoutAttributes = [NSMutableArray new];
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    CGPoint center = self.collectionView.center;
    for (NSInteger i = 0; i < numberOfItems; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.center = center;
        [self adjustAttributes:attributes forIndexPath:indexPath];
        [self.layoutAttributes addObject:attributes];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.layoutAttributes[(NSUInteger) indexPath.item];
}

- (void)invalidateLayout {
    [super invalidateLayout];
    self.layoutAttributes = nil;
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.bounds.size;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    UICollectionViewLayoutAttributes *attributes = self.layoutAttributes[(NSUInteger) itemIndexPath.item];
    if (![self isIndexPathSelected:itemIndexPath]) {
        attributes.size = PhotoStreamLayoutItemSize;
    }
    return attributes;
}


#pragma mark - Helpers

- (void)adjustAttributes:(UICollectionViewLayoutAttributes *)attributes forIndexPath:(NSIndexPath *)indexPath {
    if ([self isIndexPathSelected:indexPath]) {
        attributes.size = self.itemSize;
        attributes.alpha = 1.0f;
    } else {
        attributes.size = CGSizeZero;
        attributes.alpha = 0.0f;
    }
}

- (BOOL)isIndexPathSelected:(NSIndexPath *)indexPath {
    for (NSIndexPath *selectedIndexPath in self.collectionView.indexPathsForSelectedItems) {
        if ([selectedIndexPath isEqual:indexPath]) {
            return YES;
        }
    }
    return NO;
}

@end

