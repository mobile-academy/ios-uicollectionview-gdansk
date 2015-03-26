//
//  AppDelegate.m
//  UICollectionViewWorkshop
//
//  Created by Maciej Oczko on 26/03/15.
//  Copyright (c) 2015 Mobile Academy. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+Workshop.h"
#import "RootTabBarController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [RootTabBarController new];
    [self.window makeKeyAndVisible];
    [self modifyAppearance];
    return YES;
}

- (void)modifyAppearance {
    UIColor *workshopBackgroundColor = [UIColor barsBackgroundTintColor];
    UIColor *tintColor = [UIColor textColor];
    [[UINavigationBar appearance] setBarTintColor:workshopBackgroundColor];
    [[UINavigationBar appearance] setTintColor:tintColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : tintColor}];

    [[UITabBar appearance] setBarTintColor:workshopBackgroundColor];
    [[UITabBar appearance] setTintColor:tintColor];

    [[UIRefreshControl appearance] setTintColor:tintColor];
}

@end
