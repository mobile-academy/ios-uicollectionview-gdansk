//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemPreviewViewController.h"
#import "StreamItem.h"
#import "StreamItemPreviewLayout.h"

@implementation StreamItemPreviewViewController

#pragma mark - Object life cycle

- (instancetype)initWithStreamItem:(StreamItem *)streamItem {
    self = [super initWithCollectionViewLayout:[StreamItemPreviewLayout new]];
    if (self) {
        self.streamItem = streamItem;
        self.title = self.streamItem.title;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                               target:self
                                                                                               action:@selector(doneBarButtonPressed:)];
    }
    return self;
}

#pragma mark - Actions

- (void)doneBarButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end