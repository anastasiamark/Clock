//
//  AMTime.m
//  ClockAnimation
//
//  Created by Mark on 24.10.15.
//  Copyright © 2015 ThinkMobiles. All rights reserved.
//

#import "AMTime.h"

@implementation AMTime

#pragma mark - Lifecycle

- (instancetype)initWithDate:(NSDate*)date
{
    self = [super init];
    if (self) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        _minutes = [calendar component:NSCalendarUnitMinute fromDate:date];
        _hours = [calendar component:NSCalendarUnitHour fromDate:date];
        _seconds = [calendar component:NSCalendarUnitSecond fromDate:date];
    }
    return self;
}

+ (instancetype)timeWithDate:(NSDate *)date
{
    return [[self alloc]initWithDate:date];
}

@end
