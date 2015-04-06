/*
 * Copyright (c) 2015 Mobile Academy. All rights reserved.
 */
#import <MTDates/NSDate+MTDates.h>
#import "CalendarViewController.h"
#import "CalendarCollectionViewLayout.h"
#import "ExampleCalendarEvent.h"
#import "CalendarCollectionViewCell.h"
#import "CalendarEventsProvider.h"
#import "CalendarEventsProvider.h"


@implementation CalendarViewController

- (instancetype)initWithCalendarEventsProvider:(CalendarEventsProvider *)calendarEventsProvider {
    CalendarCollectionViewLayout *layout = [[CalendarCollectionViewLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _calendarEventsProvider = calendarEventsProvider;

        self.calendarEvents = [self.calendarEventsProvider calendarEvents];

        self.title = @"Calendar";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"Clock"]
                                                          tag:3];
    }

    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[CalendarCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
}

#pragma mark - UICollectionView Delegate & Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.calendarEvents.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    ExampleCalendarEvent *event = self.calendarEvents[(NSUInteger) indexPath.row];
    cell.textLabel.text = event.name;

    return cell;
}

#pragma mark - Calendar Events Extended Delegate

- (NSDate *)startOfDisplayedDateForCalendarCollectionViewLayout:(CalendarCollectionViewLayout *)layout {
    return [self.calendarEventsProvider.displayedDay mt_startOfCurrentDay];
}

- (NSDate *)endOfDisplayedDateForCalendarCollectionViewLayout:(CalendarCollectionViewLayout *)layout {
    return [self.calendarEventsProvider.displayedDay mt_endOfCurrentDay];
}

- (NSDate *)beadViewDateForCalendarCollectionViewLayout:(CalendarCollectionViewLayout *)layout {
    return [NSDate date];
}

@end
