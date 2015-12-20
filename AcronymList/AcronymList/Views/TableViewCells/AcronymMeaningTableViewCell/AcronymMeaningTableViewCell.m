//
//  AcronymMeaningTableViewCell.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "AcronymMeaningTableViewCell.h"
#import "AcronymMeaning.h"

@interface AcronymMeaningTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *acronymMeaningLabel;
@property (weak, nonatomic) IBOutlet UILabel *occurrenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *sinceLabel;

@property (copy, nonatomic) NSString *localizedOccurrenceFormat;
@property (copy, nonatomic) NSString *localizedSinceFormat;

@end

//KS: TODO - add dynamic cell sizing

@implementation AcronymMeaningTableViewCell

//KS: separating this out in properties and a separate method is an overkill here but handy when project is bigger so that all localization done in a consistent way
- (void)localizeStrings {
    self.localizedOccurrenceFormat = NSLocalizedString(@"Occurrence: %@", @"Number of meaning occurrences.");
    self.localizedSinceFormat = NSLocalizedString(@"Since: %@", @"Year since the meaning was used.");
}

- (void)configureWithAcronymMeaning:(AcronymMeaning *)acronymMeaning {
    [self localizeStrings];
    
    self.acronymMeaningLabel.text = acronymMeaning.fullName;
    self.occurrenceLabel.text = [NSString stringWithFormat:self.localizedOccurrenceFormat, acronymMeaning.numberOfOccuranceString];
    self.sinceLabel.text = [NSString stringWithFormat:self.localizedSinceFormat, acronymMeaning.yearSinceString];
}

@end
