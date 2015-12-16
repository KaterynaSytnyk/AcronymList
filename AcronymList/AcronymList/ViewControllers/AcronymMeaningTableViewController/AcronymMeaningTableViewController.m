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

static NSString *const ReusableCellIndentifier = @"AcronymMeaningTableViewCellReuseIdentifier";
static CGFloat const CellHeight = 62;

@interface AcronymMeaningTableViewController ()

@property (strong, nonatomic) Acronym *acronym;
@property (strong, nonatomic) NSArray *acronymMeanings;


@end

@implementation AcronymMeaningTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView heightForRowAtIndexPath:indexPath];
}



@end
