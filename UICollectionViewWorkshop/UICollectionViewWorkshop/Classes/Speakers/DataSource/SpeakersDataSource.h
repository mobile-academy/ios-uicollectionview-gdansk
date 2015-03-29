//
// Created by Maciej Oczko on 29/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    To complete the exercise please go to source file.
 */

@interface SpeakersDataSource : NSObject
@property(nonatomic, readonly) NSArray *speakerItems;

- (void)bindWithCollectionView:(UICollectionView *)collectionView;
@end
