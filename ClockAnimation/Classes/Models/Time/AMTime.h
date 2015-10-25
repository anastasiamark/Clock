//
//  AMTime.h
//  ClockAnimation
//
//  Created by Mark on 24.10.15.
//  Copyright © 2015 ThinkMobiles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMTime : NSDate

@property (nonatomic, readonly) NSInteger seconds;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger hours;

+ (instancetype)timeWithDate:(NSDate *)date;

@end
