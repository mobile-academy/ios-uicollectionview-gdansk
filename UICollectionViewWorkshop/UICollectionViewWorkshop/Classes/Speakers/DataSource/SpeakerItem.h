//
// Created by Maciej Oczko on 29/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpeakerItem : NSObject
@property(nonatomic, readonly) UIImage *image;

+ (instancetype)itemWithImage:(UIImage *)image;
- (instancetype)initWithImage:(UIImage *)image;

@end
