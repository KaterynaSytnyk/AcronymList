//
//  AcronymMeaningTableViewCell.h
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AcronymMeaning;

@interface AcronymMeaningTableViewCell : UITableViewCell

- (void)configureWithAcronymMeaning:(AcronymMeaning *)acronymMeaning;

@end
