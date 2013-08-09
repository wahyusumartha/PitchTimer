//
//  PTScreenTimer.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/9/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTMacro.h"
#import "PTScreenTimer.h"

@interface PTScreenTimer() {
    NSInteger _remainingTime;
}

@end

@implementation PTScreenTimer

@synthesize timer;
@synthesize delegate;

- (void)startTimer:(NSInteger)seconds
{
    if (!self.timer) {
        
        _remainingTime = seconds;

        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownTimer:) userInfo:nil repeats:YES];
        
        if ([self.delegate respondsToSelector:@selector(didStartTimer)]) {
            
            [self.delegate didStartTimer];
        
        } else {
            DLog(@"Did not assign delegate or did not implement [PTScreenTimerDelegate didStartTimer]")
        }
        
    } else {
        ULog(@"Timer is already initialized");
    }
}

- (void)pauseTimer
{
    [self.timer invalidate];
    self.timer = nil;
    
    if (!self.timer) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownTimer:) userInfo:nil repeats:YES];
        
    } else {
        ULog(@"Timer is already initialized");
    }
}

- (void)stopTimer
{
    [self resetStatus];
}

#pragma mark - Timer Selector 
- (void)countDownTimer:(NSTimer *)timer
{
    _remainingTime--;
    
    // send a message if counting down still running
    if ([self.delegate respondsToSelector:@selector(countingDown:)]) {
        
        [self.delegate countingDown:_remainingTime];
        
    } else {
        DLog(@"Did not assign delegate or did not implement [PTScreenTimerDelegate countingDown]");
    }

    
    if (_remainingTime == 0) {
        
        [self resetStatus];
        
        // send a message if timer is already stop
        if ([self.delegate respondsToSelector:@selector(didStopTimer)]) {
            
            [self.delegate didStopTimer];
        
        } else {
            DLog(@"Did not assign delegate or did not implement [PTScreenTimerDelegate didStopTimer]");
        }
        
    } else if (_remainingTime == warningState) {
        
        // send a message if timer is almost finish
        if ([self.delegate respondsToSelector:@selector(didReceiveTimerWarningState)]) {
            
            [self.delegate didReceiveTimerWarningState];
            
        } else {
            DLog(@"Did not assign delegate or did not implement [PTScreenTimerDelegate didReceiveTimerWarningState]");
        }
        
    }
}

#pragma mark - Reset Status 
- (void)resetStatus
{
    [self.timer invalidate];
    self.timer = nil;
    
    _remainingTime = 0;
    
}

@end
