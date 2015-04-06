/*
 * Copyright (c) 2015 Mobile Academy. All rights reserved.
 */
#import "CalendarViewController.h"


@implementation CalendarViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Carousel";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"Hand"]
                                                          tag:3];
    }

    return self;
}

@end
