//
// Created by Maciej Oczko on 26/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "RootTabBarController.h"
#import "SpeakersViewController.h"
#import "AgendaViewController.h"
#import "CarouselViewController.h"
#import "PhotoStreamViewController.h"
#import "DynamicsViewController.h"
#import "UINavigationController+Utilities.h"
#import "SpeakersDataSource.h"

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[
            [UINavigationController withController:[SpeakersViewController withDataSource:[SpeakersDataSource new]]],
            [UINavigationController withController:[AgendaViewController new]],
            [UINavigationController withController:[CarouselViewController new]],
            [UINavigationController withController:[PhotoStreamViewController new]],
            [UINavigationController withController:[DynamicsViewController new]],
    ];

}

@end
