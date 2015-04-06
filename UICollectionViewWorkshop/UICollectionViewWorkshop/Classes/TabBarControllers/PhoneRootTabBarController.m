/*
 * Copyright (c) 2015 Mobile Academy. All rights reserved.
 */

#import "PhoneRootTabBarController.h"
#import "SpeakersViewController.h"
#import "AgendaViewController.h"
#import "CarouselViewController.h"
#import "PhotoStreamViewController.h"
#import "DynamicsViewController.h"
#import "UINavigationController+Utilities.h"
#import "SpeakersDataSource.h"
#import "CalendarViewController.h"
#import "CalendarEventsProvider.h"

@implementation PhoneRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[
            [UINavigationController withController:[SpeakersViewController withDataSource:[SpeakersDataSource new]]],
            [UINavigationController withController:[self calendarViewController]],
            [UINavigationController withController:[PhotoStreamViewController new]],
            [UINavigationController withController:[DynamicsViewController new]],
    ];

}

- (CalendarViewController *)calendarViewController {
    CalendarEventsProvider *provider = [[CalendarEventsProvider alloc] initWithDisplayedDay:[NSDate date]];

    CalendarViewController *calendarViewController = [[CalendarViewController alloc] initWithCalendarEventsProvider:provider];
    return calendarViewController;
}

@end
