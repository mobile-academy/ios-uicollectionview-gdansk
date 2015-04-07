#import "Specs.h"
#import "StreamItemPreviewViewController.h"
#import <UIKit/UIKit.h>

SpecBegin(StreamItemPreviewViewControllerSpec)
describe(@"StreamItemPreviewViewController", ^{

    __block StreamItemPreviewViewController *streamItemPreviewViewController;

    beforeEach(^{
        streamItemPreviewViewController = [StreamItemPreviewViewController new];
    });

    afterEach(^{
        streamItemPreviewViewController = nil;
    });
});
SpecEnd