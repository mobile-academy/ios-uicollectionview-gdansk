//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "PhotoStreamCell.h"


@implementation PhotoStreamCell

#pragma mark - Object life cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithImage:nil];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
}

/*
 Without the following code subviews of the cell jump immediately to their new layout's frames.
 The solution is to simply force immediate layout of the cells subviews when the layout attributes are updated.

 Why does this work?
 When the collection view changes layouts, applyLayoutAttributes: is called for each cell as the collection
 view is setting up the animation block for that transition.
 But the layout of the cell's subviews is not done immediately - it is deferred to a later run loop -
 resulting in the actual subview layout changes not being incorporated into the animation block,
 so the subviews jump to their final positions immediately. Calling layoutIfNeeded means that we are telling
 the cell that we want the subview layout to happen immediately, so the layout is done within the animation block,
 and the subviews' frames are animated along with the cell itself.

 Reference: http://stackoverflow.com/a/23746693/4655732
 */
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    [self layoutIfNeeded];
}


@end