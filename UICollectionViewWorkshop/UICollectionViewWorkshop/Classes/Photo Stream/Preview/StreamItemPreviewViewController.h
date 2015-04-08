//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class StreamItem;

@interface StreamItemPreviewViewController : UICollectionViewController
@property(nonatomic, strong) StreamItem *streamItem;

- (instancetype)initWithStreamItem:(StreamItem *)streamItem;

@end