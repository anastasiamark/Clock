//
//  AMClockController.m
//  ClockAnimation
//
//  Created by Mark on 21.10.15.
//  Copyright © 2015 ThinkMobiles. All rights reserved.
//

#import "AMClockController.h"

#import "AMTime.h"

@interface AMClockController ()

@property (weak, nonatomic) IBOutlet UIImageView *hourArrowImageView;
@property (weak, nonatomic) IBOutlet UIImageView *minuteArrowImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondArrowImageView;

@property (nonatomic) CGFloat startHourArrowValue;
@property (nonatomic) CGFloat startMinuteArrowValue;
@property (nonatomic) CGFloat startSecondArrowValue;

@end

@implementation AMClockController

#pragma mark - View Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self beginPositionForArrows];
   
    [self animateArrow:self.hourArrowImageView withBeginValue:self.startHourArrowValue andDuration:60 * 60 * 60];
    [self animateArrow:self.minuteArrowImageView withBeginValue:self.startMinuteArrowValue andDuration:60 * 60];
    [self animateArrow:self.secondArrowImageView withBeginValue:self.startSecondArrowValue andDuration:60];
}

#pragma mark - Animations

- (void)animateArrow:(UIImageView *)arrowImage withBeginValue:(CGFloat)beginValue andDuration:(CGFloat)duration
{
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = INFINITY;
    animation.fromValue = [NSNumber numberWithFloat:beginValue];
    animation.toValue = [NSNumber numberWithFloat:(360 * M_PI/180 + beginValue)];
    [arrowImage.layer addAnimation:animation forKey:@"transform"];
    
    CGAffineTransform rot = CGAffineTransformMakeRotation(360*M_PI/180 + beginValue);
    arrowImage.transform = rot;
}

#pragma mark - Start Arrows Positions

- (void)beginPositionForArrows
{
    NSDate *now = [NSDate date];
    AMTime *time = [AMTime timeWithDate:now];
    NSInteger s = time.seconds;
    NSInteger m = time.minutes;
    NSInteger h = time.hours;
    
    self.startSecondArrowValue = (M_PI/30)*s;
    self.startMinuteArrowValue = (M_PI/30)*m + (M_PI/1800)*s;
    self.startHourArrowValue = (M_PI/6)*(h) + (M_PI/360)*m + (M_PI/21600)*s;
}

@end
