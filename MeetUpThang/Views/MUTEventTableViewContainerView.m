//
//  MUTEventTableViewContainerView.m
//  MeetUpThang
//
//  Created by Jay Chae  on 10/19/13.
//  Copyright (c) 2013 MeetUpThang. All rights reserved.
//

#import "MUTEventTableViewContainerView.h"

@implementation MUTEventTableViewContainerView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.eventTableViewShown = NO;
    }
    return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:self];
    CGFloat x = point.x;
    CGFloat y = point.y;

    if (y > 508) {
        return NO;
    }
    
    return YES;
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.eventTableViewShown == NO) {
        if (point.y <= 508) {
            return nil;
        } else {
            return self;
        }
    } else {
        for (UIView *subview in self.subviews) {
            CGPoint subPoint = [subview convertPoint:point fromView:self];
            UIView *result = [subview hitTest:subPoint withEvent:event];
            if (result != nil) {
                return result;
                break;
            }
        }
        return self;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
//    CGPoint point = [touch locationInView:self];
    CGFloat x = point.x;
    CGFloat y = point.y;

    if (y > 508) {
        return NO;
    }
    
    return YES;
}

//- (BOOL)touchesShouldBegin:(NSSet *)aTouches withEvent:(UIEvent *)aEvent inContentView:(UIView *)aView {
//    UITouch *touch = [aTouches allObjects][0];
//    CGPoint point = [touch locationInView:self];
//    CGFloat x = point.x;
//    CGFloat y = point.y;
//
//    if (y > 508) {
//        return NO;
//    }
//    
//    return YES;
//}
@end
