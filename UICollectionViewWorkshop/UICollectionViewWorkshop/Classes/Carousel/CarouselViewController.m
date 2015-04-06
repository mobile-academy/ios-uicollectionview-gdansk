/*
 * Copyright (c) 2015 Mobile Academy. All rights reserved.
 */
#import "CarouselViewController.h"
#import "CarouselCollectionViewLayout.h"

@implementation CarouselViewController

- (id)init {
    CarouselCollectionViewLayout *layout = [[CarouselCollectionViewLayout alloc] init];
    layout.itemSize = CGSizeMake(280, 240);
    layout.interItemSpace = 20;
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.title = @"Carousel";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"Hand"]
                                                          tag:3];
    }

    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];

    self.collectionView.backgroundColor = [UIColor greenColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - UICollectionView Delegate & Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.9f green:0.2f blue:0.2f alpha:1.0f];
    return cell;
}

@end
