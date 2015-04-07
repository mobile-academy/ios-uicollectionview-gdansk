/*
 * Copyright (c) 2015 Mobile Academy. All rights reserved.
 */

#import "AppDelegate.h"
#import "UIColor+Workshop.h"
#import "PhoneRootTabBarController.h"
#import "PadRootTabBarController.h"
#import "ConfigurationFactory.h"
#import "Configurator.h"

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        self.device = [UIDevice currentDevice];
    }

    return self;
}

#pragma mark -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureAppWithLaunchOptions:launchOptions];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController *rootViewController = nil;
    if (self.device.userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        rootViewController = [PhoneRootTabBarController new];
    }
    else {
        rootViewController = [PadRootTabBarController new];
    }

    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    [self modifyAppearance];
    return YES;
}

- (void)configureAppWithLaunchOptions:(NSDictionary *)launchOptions {
    Configurator *configurator = [Configurator new];
    ConfigurationFactory *configurationFactory = [ConfigurationFactory new];
    [configurator configureAppUsingConfiguration:[configurationFactory applicationConfiguration] launchOptions:launchOptions];
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
