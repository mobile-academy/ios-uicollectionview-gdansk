//
// Created by Maciej Oczko on 29/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "SpeakerCollectionViewCell.h"

@interface SpeakerCollectionViewCell ()
@property(nonatomic, readwrite) UIImageView *imageView;
@end

@implementation SpeakerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [UIImageView new];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.imageView];
        self.clipsToBounds = YES;
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

@end
