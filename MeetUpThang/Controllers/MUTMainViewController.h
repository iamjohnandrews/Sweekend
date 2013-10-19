//
//  MUTMainViewController.h
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <MapKit/MapKit.h>

@import MapKit;
@class MUTEventTableViewContainerView;

@interface MUTMainViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mainMapView;
@property (nonatomic, strong) IBOutlet MUTEventTableViewContainerView *mainScrollView;
@property (nonatomic, strong) IBOutlet UINavigationBar *mainNavigationBar;
@property (nonatomic, strong) UITableView *eventTableView;

@property (nonatomic, strong) UIView *eventTableViewHandler;
@property (nonatomic, strong) UIButton *editLocationButton;

@property (nonatomic, strong) NSArray *eventDataSource;

@end
