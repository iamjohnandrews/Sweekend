//
//  MUTCategoryTableViewCell.m
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import "MUTCategoryTableViewCell.h"

@implementation MUTCategoryTableViewCell

@synthesize categoryName;
@synthesize categoryTitleLabel;
@synthesize dummyPasteImageView;
@synthesize checkMarkImageView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
