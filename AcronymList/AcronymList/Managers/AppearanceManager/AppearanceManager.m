//
//  AppearanceManager.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "AppearanceManager.h"
#import "UIColor+Utility.h"
#import "UIFont+Utility.h"

@implementation AppearanceManager

+ (void)setupAppearanceForApplication {
    [[UITextField appearanceWhenContainedInInstancesOfClasses:[NSArray arrayWithObject:[UISearchBar class]]] setTintColor:[UIColor darkGrayColor]];
}

@end
