//
//  MUTCategorySearchViewController.m
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import "MUTCategorySearchViewController.h"
#import "MUTCategoryTableViewCell.h"

@interface MUTCategorySearchViewController ()

@property (nonatomic, strong) NSArray *suggestions;

@end

@implementation MUTCategorySearchViewController

@synthesize suggestions;
@synthesize searchResultTableView;
@synthesize categorySearchBar;
@synthesize suggestionTableView;
@synthesize searchNavigationbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initSearchResultTableView];
    [self _initSuggestionsTableView];
    [self _initCategorySearchBar];
    [self _initSearchNavigationBar];
    [self _initSuggestionArray];
}

- (void)_initSearchResultTableView {
    [searchResultTableView setBackgroundColor:[UIColor greenColor]];
    [searchResultTableView setAlpha:0.0];
    [searchResultTableView setDelegate:self];
    [searchResultTableView setDataSource:self];
}

- (void)_initSuggestionsTableView {
    [suggestionTableView setDelegate:self];
    [suggestionTableView setDataSource:self];
}

- (void)_initSearchNavigationBar {
    [searchNavigationbar setTranslucent:NO];
    [searchNavigationbar setBarTintColor:[UIColor colorWithRed:0.035 green:0.737 blue:0.741 alpha:1.0]];
}


- (void)_initCategorySearchBar {
    [categorySearchBar setDelegate:self];
//    3.5, 73.7, 74.1
    
    for(UIView *subView in [categorySearchBar subviews]) {
        if([subView conformsToProtocol:@protocol(UITextInputTraits)]) {
            [(UITextField *)subView setReturnKeyType: UIReturnKeyDone];
        } else {
            for(UIView *subSubView in [subView subviews]) {
                if([subSubView conformsToProtocol:@protocol(UITextInputTraits)]) {
                    [(UITextField *)subSubView setReturnKeyType: UIReturnKeyDone];
                    [(UITextField *)subSubView setEnablesReturnKeyAutomatically:NO];
                    [(UITextField *)subSubView setKeyboardAppearance:UIKeyboardAppearanceDark];
                }
            }      
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)_initSuggestionArray {
    suggestions = @[@"Bar", @"Chinese", @"WhirleyBall", @"Bulls Game", @"Startup Weekend", @"Chipotle", @"GTA 5"];
}


#pragma mark -
#pragma UISearchBarDelegate stuff


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    if (searchBar.showsCancelButton == NO) {
        [searchBar setShowsCancelButton:YES animated:YES];
    }
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchResultTableView.alpha == 0.0) {
        [searchResultTableView setAlpha:1.0];
    }
    
    if ([searchText isEqualToString:@""]) {
        [searchResultTableView setAlpha:0.0];
    }
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.tagName BEGINSWITH[c] %@", searchText];
//    tagSearchResultArray = [[CHTag suggestedTags] filteredArrayUsingPredicate:predicate];
//    
//    [searchResultTableView reloadData];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [searchResultTableView setAlpha:0.0];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}


#pragma mark -
#pragma UITableViewDelgate+DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:suggestionTableView]) {
        MUTCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
        
        if (cell == nil) {
            cell = [[MUTCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CategoryCell"];
        }
        
        [cell.categoryTitleLabel setText:suggestions[indexPath.row]];
        
        return cell;
    } else {
        
        MUTCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
        
        if (cell == nil) {
            cell = [[MUTCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CategoryCell"];
        }
        
        [cell.categoryTitleLabel setText:suggestions[indexPath.row]];
        [cell setBackgroundColor:[UIColor blueColor]];
        return cell;
    }
}

@end
