//
//  AcronymMeaning.h
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymMeaning : NSObject

@property (copy, nonatomic) NSString *fullName;
//KS: TODO - change these 2 to NSNumber if we need to do something with these values in a addition to displaying in the cell
@property (copy, nonatomic) NSString *numberOfOccuranceString;
@property (copy, nonatomic) NSString *yearSinceString;

@end
