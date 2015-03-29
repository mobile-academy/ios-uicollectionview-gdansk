//
// Created by Maciej Oczko on 29/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "SpeakerItem.h"

@implementation SpeakerItem

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        _image = image;
    }

    return self;
}

+ (instancetype)itemWithImage:(UIImage *)image {
    return [[self alloc] initWithImage:image];
}

@end
