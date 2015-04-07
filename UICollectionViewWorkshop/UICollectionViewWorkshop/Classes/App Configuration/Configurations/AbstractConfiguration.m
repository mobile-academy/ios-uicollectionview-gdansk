//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "AbstractConfiguration.h"


@implementation AbstractConfiguration
@synthesize parseApplicationId, parseClientId;

#pragma mark - Object life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.parseApplicationId = @"INSERT-APP-ID";
        self.parseClientId = @"INSERT-CLIENT-ID";
    }
    return self;
}

@end