//
//  Acronym.h
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

//KS: TODO - see if any other properties needed for the whole app. if not - having a separate model for just holding a sting is an overkill - replace with string property in the view controller

@interface Acronym : NSObject

@property (copy, nonatomic) NSString *acronymString;

- (instancetype)initWithAcronymString:(NSString *)acronymString;

@end
