//
// Created by Maciej Oczko on 26/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpeakersDataSource;

/*
    To complete the exercise please go to source file.
 */

@interface SpeakersViewController : UIViewController
@property(nonatomic, strong, readonly) SpeakersDataSource *dataSource;

+ (instancetype)withDataSource:(SpeakersDataSource *)dataSource;
- (instancetype)initWithDataSource:(SpeakersDataSource *)dataSource NS_DESIGNATED_INITIALIZER;

@end
