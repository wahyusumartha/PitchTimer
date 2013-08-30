//
//  PTScreenTimer.h
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/9/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PTScreenTimerDelegate <NSObject>

@optional
- (void)didStartTimer;
- (void)didReceiveTimerWarningState;
- (void)didStopTimer;
- (void)countingDown:(NSInteger)remainingTime;

@end

static const NSInteger warningState = 5;

@interface PTScreenTimer : NSObject

/*
 *  Timer to count down a time that setup by user
 */
@property (nonatomic, strong) NSTimer *timer;
/*
 *  PTScreenTimer Delegate
 */
@property (nonatomic, assign) id<PTScreenTimerDelegate> delegate;

/*
 *  Start Counting Down the Timer for x seconds
 *  @param seconds 
 *      NSInteger value to start counting down
 */
- (void)startTimer:(NSInteger)seconds;
/*
 *  Pause The Timer
 */
- (void)pauseTimer;
/*
 *  Resume The Timer
 */
- (void)resumeTimer;
/*
 *  Stop Timer
 */
- (void)stopTimer;

/**
 * Remaining Time
 */
- (NSInteger)remainingTime;
@end

