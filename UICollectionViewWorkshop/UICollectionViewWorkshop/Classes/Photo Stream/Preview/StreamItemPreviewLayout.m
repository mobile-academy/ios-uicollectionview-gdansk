//
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "StreamItemPreviewLayout.h"

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
        attributes.size = self.itemSize;
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

@end