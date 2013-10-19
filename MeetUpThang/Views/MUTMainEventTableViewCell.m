//
//  MUTMainEventTableViewCell.m
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import "MUTMainEventTableViewCell.h"

@implementation MUTMainEventTableViewCell

@synthesize eventName;
@synthesize dummyHolderImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self _initDummyImageHolderView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)_initDummyImageHolderView {
    dummyHolderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 75.5)];
    
    [self.contentView addSubview:dummyHolderImageView];
}

- (void)updateCellWithEventName:(NSString *)eventname {
    [self setEventName:eventname];
    [dummyHolderImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", eventName]]];
}

@end
