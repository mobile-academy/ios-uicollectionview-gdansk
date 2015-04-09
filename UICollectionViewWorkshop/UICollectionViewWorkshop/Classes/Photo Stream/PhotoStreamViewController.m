//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "PhotoStreamViewController.h"
#import "StreamItem.h"
#import "PhotoStreamLayout.h"
#import "PhotoStreamCell.h"
#import "StreamItemPreviewViewController.h"
#import "StreamItemPreviewLayout.h"

@interface PhotoStreamViewController ()
@property(nonatomic, strong) UIRefreshControl *refreshControl;
@property(nonatomic, strong) NSMutableArray *streamItems;
@property(nonatomic, strong) UICollectionViewTransitionLayout *transitionLayout;
@end

@implementation PhotoStreamViewController

#pragma mark - Constants

NSString *const PhotoStreamViewControllerCellId = @"PhotoStreamViewControllerCellId";

#pragma mark - Object life cycle

- (id)init {
    PhotoStreamLayout *layout = [[PhotoStreamLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.streamItemUploader = [StreamItemUploader uploaderWithDelegate:self];
        self.streamItemCreator = [StreamItemCreator creatorWithDelegate:self];
        self.streamItemDownloader = [StreamItemDownloader downloaderWithDelegate:self];
        self.title = NSLocalizedString(@"Photo Stream", @"Photo Stream");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"Camera"]
                                                          tag:4];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:self
                                                                                               action:@selector(addBarButtonItemPressed:)];
    }
    return self;
}

#pragma mark - View life cycle

- (void)loadView {
    [super loadView];
    [self setupCollectionView];
    [self setupRefreshControl];
    [self setupPinchRecogniser];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.streamItemDownloader downloadStreamItems];
}

- (void)setupCollectionView {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[PhotoStreamCell class] forCellWithReuseIdentifier:PhotoStreamViewControllerCellId];
}

- (void)setupPinchRecogniser {
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(didPinch:)];
    [self.collectionView addGestureRecognizer:pinchGestureRecognizer];
}

- (void)setupRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(didPullToRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:self.refreshControl];
    self.collectionView.alwaysBounceVertical = YES;
}

- (PhotoStreamLayout *)photoStreamLayout {
    return (PhotoStreamLayout *) self.collectionView.collectionViewLayout;
}

#pragma mark - Actions

- (void)addBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self.streamItemCreator createStreamItem];
}

- (void)didPullToRefresh:(UIRefreshControl *)sender {
    [self.streamItemDownloader downloadStreamItems];
}

- (void)didPinch:(UIPinchGestureRecognizer *)recogniser {
    CGFloat progress = recogniser.scale - 1.0f; //naive way
    switch (recogniser.state) {
        case UIGestureRecognizerStateBegan: {
            [self.collectionView selectItemAtIndexPath:[self indexPathForPinch:recogniser]
                                              animated:NO
                                        scrollPosition:UICollectionViewScrollPositionNone];
            self.transitionLayout =
                [self.collectionView startInteractiveTransitionToCollectionViewLayout:[StreamItemPreviewLayout new]
                                                                           completion:^(BOOL completed, BOOL finished) {
                                                                               self.transitionLayout = nil;
                                                                           }];
        }
            break;
        case UIGestureRecognizerStateChanged:
            [self.transitionLayout setTransitionProgress:progress];
            [self.transitionLayout invalidateLayout];
            break;
        case UIGestureRecognizerStateEnded:
            if (progress > 0.5f) {
                [self.collectionView finishInteractiveTransition];
            } else {
                [self.collectionView cancelInteractiveTransition];
            }
            break;
        case UIGestureRecognizerStateCancelled:
            [self.collectionView cancelInteractiveTransition];
            break;
        default:
            break;
    }
}

- (NSIndexPath *)indexPathForPinch:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    CGPoint location = [pinchGestureRecognizer locationInView:self.collectionView];
    return [self.collectionView indexPathForItemAtPoint:location];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.streamItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoStreamCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoStreamViewControllerCellId forIndexPath:indexPath];
    StreamItem *streamItem = self.streamItems[(NSUInteger) indexPath.item];
    cell.imageView.image = [streamItem image];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    StreamItem *streamItem = self.streamItems[(NSUInteger) indexPath.item];
    StreamItemPreviewViewController *streamItemViewController = [[StreamItemPreviewViewController alloc] initWithStreamItem:streamItem];
    streamItemViewController.useLayoutToLayoutNavigationTransitions = YES;
    self.photoStreamLayout.presentedIndexPath = indexPath;
    [self.navigationController pushViewController:streamItemViewController animated:YES];
}

#pragma mark - StreamItemDownloaderDelegate

- (void)streamItemDownloader:(StreamItemDownloader *)streamItemDownloader didDownloadItems:(NSArray *)items {
    self.streamItems = [NSMutableArray arrayWithArray:items];
    [self.collectionView reloadData];
    [self.refreshControl endRefreshing];
}

#pragma mark - StreamItemCreatorDelegate

- (void)streamItemCreator:(StreamItemCreator *)streamItemCreator didCreateItem:(StreamItem *)streamItem {
    [self.streamItems addObject:streamItem];
    [self.collectionView reloadData];
    [self.streamItemUploader uploadStreamItem:streamItem];
}

- (UIViewController *)viewControllerToPresentOnImagePickerForStreamItemCreator:(StreamItemCreator *)streamItemCreator {
    return self;
}

- (UITabBar *)tabBarToPresentOnImagePickOptionsForStreamItemCreator:(StreamItemCreator *)streamItemCreator {
    return self.tabBarController.tabBar;
}

@end