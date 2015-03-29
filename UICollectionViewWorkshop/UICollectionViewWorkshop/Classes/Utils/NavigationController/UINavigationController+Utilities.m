//
// Created by Maciej Oczko on 29/03/15.
// Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "UINavigationController+Utilities.h"

@implementation UINavigationController (Utilities)

+ (instancetype)withController:(UIViewController *)viewController {
    return [[UINavigationController alloc] initWithRootViewController:viewController];
}

@end
