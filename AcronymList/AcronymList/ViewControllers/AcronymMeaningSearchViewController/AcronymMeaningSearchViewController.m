//
//  AcronymMeaningSearchViewController.m
//  AcronymList
//
//  Created by Kateryna Sytnyk on 12/16/15.
//  Copyright © 2015 KaterynaSytnyk. All rights reserved.
//

#import "AcronymMeaningSearchViewController.h"
#import "AcronymMeaning.h"
#import "Acronym.h"
#import "DataManager.h"
#import "MBProgressHUD.h"
#import "AcronymMeaningTableViewCell.h"
#import "GlobalLocalizations.h"
#import <UIViewController+KeyboardAdditions.h>

static NSString *const ReusableCellIndentifier = @"AcronymMeaningTableViewCellReuseIdentifier";
static CGFloat const CellHeight = 62;

@interface AcronymMeaningSearchViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Acronym *acronym;
@property (strong, nonatomic) NSArray *acronymMeanings;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewBottomLayoutConstraint;


@end

@implementation AcronymMeaningSearchViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self ka_startObservingKeyboardNotifications];
    [self.searchBar becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self ka_stopObservingKeyboardNotifications];
}

#pragma mark - Keyboard Notifications

- (void)ka_keyboardShowOrHideAnimationWithHeight:(CGFloat)height
                               animationDuration:(NSTimeInterval)animationDuration
                                  animationCurve:(UIViewAnimationCurve)animationCurve {
    
    //KS: adjust the bottom constraint of UITableView in order to show a UITableView above the keyboard
    
    self.tableViewBottomLayoutConstraint.constant = height;
    [self.view layoutIfNeeded];
}

#pragma mark - UISearchBar delegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    
    NSString *searchString = searchBar.text;
    Acronym *acronym = [[Acronym alloc] initWithAcronymString:searchString];
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
