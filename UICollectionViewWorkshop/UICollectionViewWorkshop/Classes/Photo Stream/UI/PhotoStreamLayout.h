//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

extern CGSize const PhotoStreamLayoutItemSize;

@interface PhotoStreamLayout : UICollectionViewFlowLayout
@property(nonatomic, strong) NSIndexPath *presentedIndexPath;
@end