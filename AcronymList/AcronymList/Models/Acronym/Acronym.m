//
//  Acronym.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "Acronym.h"
#import "NSString+Utility.h"

@implementation Acronym

- (instancetype)initWithAcronymString:(NSString *)acronymString {
    self = [super init];
    
    if (self) {
        self.acronymString = [acronymString ac_trimmedOfWhitespace];
    }
    
    return self;
}


@end
