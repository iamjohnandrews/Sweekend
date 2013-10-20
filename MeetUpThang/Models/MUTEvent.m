//
//  MUTEvent.m
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import "MUTEvent.h"

@implementation MUTEvent

@synthesize description;
@synthesize eventTime;
@synthesize eventLocation;

@synthesize minimumAttendants;
@synthesize maximumAttendants;

@synthesize category;


+ (NSArray *)sharedEvents {
    MUTEvent *event1 = [self demoEvent1];
    MUTEvent *event2 = [self demoEvent2];
    
    return @[event1, event2];
}



+ (id)demoEvent1 {
    MUTEvent *event = [[MUTEvent alloc] init];
    [event setDescription:@"YOOOOOO"];
    [event setEventTime:[NSDate date]];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:41.885345935858936 longitude:-87.64173746109009];
    [event setEventLocation:location];
    
    return event;
}


+ (id)demoEvent2 {
    MUTEvent *event = [[MUTEvent alloc] init];
    [event setDescription:@"YOOOOOO"];
    [event setEventTime:[NSDate date]];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:41.89243837895936 longitude:-87.62984991073608];
    [event setEventLocation:location];
    
    return event;
}



@end
