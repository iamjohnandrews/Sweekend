//
//  MUTCategorySearchViewController.h
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUTCategorySearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) IBOutlet UITableView *suggestionTableView;
@property (nonatomic, strong) IBOutlet UITableView *searchResultTableView;
@property (nonatomic, strong) IBOutlet UISearchBar *categorySearchBar;
@property (nonatomic, strong) IBOutlet UINavigationBar *searchNavigationbar;

@end
