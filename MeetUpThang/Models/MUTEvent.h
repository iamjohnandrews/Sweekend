//
//  MUTEvent.h
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;

@interface MUTEvent : NSObject

+ (NSArray *)sharedEvents;

+ (id)demoEvent1;
+ (id)demoEvent2;

@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *eventTime;
@property (nonatomic, strong) CLLocation *eventLocation;

@property (nonatomic) NSInteger *minimumAttendants;
@property (nonatomic) NSInteger *maximumAttendants;

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *tag;

@end
