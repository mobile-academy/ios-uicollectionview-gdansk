/*
 * Copyright (c) 2015 Mobile Academy. All rights reserved.
 */
#import "PadRootTabBarController.h"
#import "CarouselViewController.h"
#import "UINavigationController+Utilities.h"


@implementation PadRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[
            [UINavigationController withController:[CarouselViewController new]],
    ];
}

@end
