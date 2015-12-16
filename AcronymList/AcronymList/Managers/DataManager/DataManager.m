//
//  DataManager.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "DataManager.h"

//http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=FBI
//

@interface DataManager ()

@end

@implementation DataManager

+ (instancetype)sharedManager {
    static DataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [DataManager new];
    });
    return sharedManager;
}


@end
