//
//  MUTMainEventTableViewCell.h
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUTMainEventTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* dummyHolderImageView;
@property (nonatomic, strong) NSString *eventName;


- (void)updateCellWithEventName:(NSString *)eventname;

@end
