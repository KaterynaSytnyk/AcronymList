//
//  ParsingManager.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "ParsingManager.h"

@interface ParsingManager ()

@end

@implementation ParsingManager

+ (instancetype)sharedManager {
    static ParsingManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [ParsingManager new];
    });
    return sharedManager;
}


@end
