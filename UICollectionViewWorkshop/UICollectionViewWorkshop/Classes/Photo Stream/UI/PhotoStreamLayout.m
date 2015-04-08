//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "PhotoStreamLayout.h"


@implementation PhotoStreamLayout

#pragma mark - Constants

CGSize const PhotoStreamLayoutItemSize = {.width = 77.0f, .height = 77.0f};

#pragma mark - Object life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.sectionInset = UIEdgeInsetsMake(8.0f, 0.0f, 8.0f, 0.0f);
        self.minimumInteritemSpacing = 4.0f;
        self.minimumLineSpacing = 4.0f;
        self.itemSize = PhotoStreamLayoutItemSize;
    }
    return self;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    if ([self.presentedIndexPath isEqual:itemIndexPath]) {
        attributes.size = self.collectionView.bounds.size;
    }
    return attributes;
}



@end