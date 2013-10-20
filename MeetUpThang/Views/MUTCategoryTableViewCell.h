//
//  MUTCategoryTableViewCell.h
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUTCategoryTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *categoryTitleLabel;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) IBOutlet UIImageView *dummyPasteImageView;
@property (nonatomic, strong) IBOutlet UIImageView *checkMarkImageView;

@end
