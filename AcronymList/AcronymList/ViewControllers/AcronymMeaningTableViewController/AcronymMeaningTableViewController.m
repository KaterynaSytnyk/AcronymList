//
//  AcronymMeaningTableViewController.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "AcronymMeaningTableViewController.h"
#import "AcronymMeaning.h"
#import "Acronym.h"
#import "DataManager.h"
#import "MBProgressHUD.h"
#import "AcronymMeaningTableViewCell.h"
#import "GlobalLocalizations.h"

static NSString *const ReusableCellIndentifier = @"AcronymMeaningTableViewCellReuseIdentifier";
static CGFloat const CellHeight = 62;

@interface AcronymMeaningTableViewController ()

@property (strong, nonatomic) Acronym *acronym;
@property (strong, nonatomic) NSArray *acronymMeanings;


@end

@implementation AcronymMeaningTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Acronym *acronym = [[Acronym alloc] initWithAcronymString:@"FBI"];
    [self searchAcronymMeaningsWithAcronym:acronym];
}

#pragma mark - Loading Data

- (void)searchAcronymMeaningsWithAcronym:(Acronym *)acronym {
    
    __weak typeof(self) weakSelf = self;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[DataManager sharedManager] searchAcronymMeaningsWithAcronym:acronym successHandler:^(NSArray *acronymMeanings) {
        
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        weakSelf.acronymMeanings = acronymMeanings;
        [weakSelf.tableView reloadData];
        
    } errorHandler:^(NSString *localizedErrorMessage) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        [weakSelf showAlertWithLocalizedTitle:nil localizedMessage:localizedErrorMessage];
    }];
}

#pragma mark - Actions



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.acronymMeanings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcronymMeaningTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ReusableCellIndentifier forIndexPath:indexPath];
    
    
    AcronymMeaning *acronymMeaning = self.acronymMeanings[indexPath.row];
    [cell configureWithAcronymMeaning:acronymMeaning];
    
    return cell;
}



#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView heightForRowAtIndexPath:indexPath];
}

#pragma mark - Utility

- (void)showAlertWithLocalizedTitle:(NSString *)localizedTitle localizedMessage:(NSString *)localizedMessage {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:localizedTitle
                                                                   message:localizedMessage
                                                            preferredStyle:(UIAlertControllerStyleAlert)];
    
    [alert addAction:[UIAlertAction actionWithTitle:[GlobalLocalizations localizedGlobalOk]
                                              style:(UIAlertActionStyleDefault) handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
