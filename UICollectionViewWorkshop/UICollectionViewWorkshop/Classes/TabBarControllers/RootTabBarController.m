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

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[
            [[UINavigationController alloc] initWithRootViewController:[SpeakersViewController new]],
            [[UINavigationController alloc] initWithRootViewController:[AgendaViewController new]],
            [[UINavigationController alloc] initWithRootViewController:[CarouselViewController new]],
            [[UINavigationController alloc] initWithRootViewController:[PhotoStreamViewController new]],
            [[UINavigationController alloc] initWithRootViewController:[DynamicsViewController new]],
    ];

}


@end
