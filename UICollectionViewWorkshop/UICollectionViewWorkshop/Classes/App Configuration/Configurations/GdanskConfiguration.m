//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "GdanskConfiguration.h"


@implementation GdanskConfiguration
@synthesize parseApplicationId, parseClientId;

#pragma mark - Object life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.parseApplicationId = @"TwQIg7i1cmOvSy3tFJQ0pp6g5KDyUaltMNhPOgpu";
        self.parseClientId = @"OxkOrKFhGqpia8Uku6BtSJLe9gKbdr6Dw2RkRvM5";
    }
    return self;
}

@end