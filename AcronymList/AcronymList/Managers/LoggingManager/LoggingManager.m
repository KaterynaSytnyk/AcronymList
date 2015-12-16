//
//  LoggingManager.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "LoggingManager.h"

@interface LoggingManager ()

@end

@implementation LoggingManager


+ (instancetype)sharedManager {
    static LoggingManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [LoggingManager new];
    });
    return sharedManager;
}


@end
