//
//  MUTMainViewController.m
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import "MUTMainViewController.h"
#import "MUTEventTableViewContainerView.h"
#import "MUTMainEventTableViewCell.h"
#import "SWRevealViewController.h"


@interface MUTMainViewController ()

@end

@implementation MUTMainViewController

@synthesize eventTableViewHandler;
@synthesize editLocationButton;
@synthesize mainNavigationBar;
@synthesize eventDataSource, revealButtonItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initDataSource];
    [self _initMainScrollView];
    [self _initEventTableViewHandler];
    [self _initEditLocationButton];
    [self _initEventTableView];
    //[self _initMainNavigationBar];
    
    [self.revealButtonItem setTarget: self.revealViewController];
    [self.revealButtonItem setAction: @selector( revealToggle: )];
    [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
}

- (void)_initMainScrollView {
    [self.mainScrollView setContentSize:CGSizeMake(320, 1136)];
    UILabel *dummy = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [dummy setBackgroundColor:[UIColor blackColor]];
    [self.mainScrollView setDelegate:self];
    [self.mainScrollView addSubview:dummy];
}

- (void)_initEditLocationButton {
    CGRect frameForEditLocationButton = CGRectMake(320-12.5-10, 10, 12.5, 20.5);
    editLocationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editLocationButton setFrame:frameForEditLocationButton];
    [editLocationButton addTarget:self action:@selector(hideEventTableView:) forControlEvents:UIControlEventTouchUpInside];
    [editLocationButton setImage:[UIImage imageNamed:@"map-view.png"] forState:UIControlStateNormal];
    
    [eventTableViewHandler addSubview:editLocationButton];
}

//- (void)_initMainNavigationBar {
//    [mainNavigationBar setBarTintColor:[UIColor colorWithRed:0.035 green:0.737 blue:0.741 alpha:1.0]];
//}

- (void)hideEventTableView:(id)sender {
    [self.mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.mainScrollView setEventTableViewShown:NO];
}

- (void)_initEventTableViewHandler {
    CGRect frame = CGRectMake(0, 568, 320, 40);
    eventTableViewHandler = [[UIView alloc] initWithFrame:frame];
    UIImageView *containerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sub-nav-sort.png"]];
    [containerImageView setFrame:eventTableViewHandler.bounds];
    [eventTableViewHandler setBackgroundColor:[UIColor greenColor]];
    [eventTableViewHandler addSubview:containerImageView];
    [eventTableViewHandler addSubview:editLocationButton];
    
    [self.mainScrollView addSubview:eventTableViewHandler];
}

- (void)_initEventTableView {
    self.eventTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 608, 320, 400)];
    [self.eventTableView setBackgroundColor:[UIColor blackColor]];
    [self.eventTableView setDelegate:self];
    [self.eventTableView setDataSource:self];
    
    [self.mainScrollView addSubview:self.eventTableView];
}


- (void)_initDataSource {
    eventDataSource = @[@"event-1", @"event-2", @"event-3", @"event-4", @"event-5", @"event-6", @"event-7"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([scrollView isKindOfClass:[MUTEventTableViewContainerView class]]) {
        CGPoint offest = scrollView.contentOffset;
        
        if (offest.y > 80) {
            [scrollView setContentOffset:CGPointMake(0, 524) animated:YES];
            MUTEventTableViewContainerView *eventScrollView = (MUTEventTableViewContainerView *)scrollView;
            [eventScrollView setEventTableViewShown:YES];
        }
    }
}

#pragma mark -
#pragma UITableViewDelegate stuff

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MUTMainEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainEventCell"];
    if (cell == Nil) {
        cell = [[MUTMainEventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainEventCell"];
    }
    
//    [cell.dummyHolderImageView setImage:[UIImage imageNamed:@"event-1.png"]];
    [cell updateCellWithEventName:eventDataSource[indexPath.row]];
    return cell;
}


- (IBAction)sidebarButton:(id)sender {
}
@end
