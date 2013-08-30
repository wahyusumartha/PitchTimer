//
//  PTScreenTimerSpec.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/29/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "PTScreenTimer.h"

SPEC_BEGIN(ScreenTimerSpec)

    __block PTScreenTimer *screenTimer = nil;
    const NSInteger countingDown = 10;

    beforeEach(^{
        screenTimer = [[PTScreenTimer alloc] init];
        [screenTimer startTimer:countingDown];
    });

    afterEach(^{
        [screenTimer stopTimer];
        screenTimer = nil;
    });
    /*
     *  Screen Timer Spec
     */

    context(@"Screen Timer Should Counting Down", ^{
        
        it(@"screen timer object should not be nil", ^{
            [[screenTimer shouldNot] beNil];
        });
        
        it(@"screen timer object should start counting down for one second", ^{
            [[expectFutureValue([NSNumber numberWithInt:[screenTimer remainingTime]]) shouldEventually] equal:theValue(countingDown-1)];
        });
        
        it(@"screen time should send warning state if time remaining less than 5 second", ^{
            [[expectFutureValue([NSNumber numberWithInt:[screenTimer remainingTime]]) shouldEventuallyBeforeTimingOutAfter(5)] equal:theValue(5)];
        });
        
        it(@"screen time should be nil when time remaining equal 0", ^{
            [[expectFutureValue([NSNumber numberWithInt:[screenTimer remainingTime]]) shouldEventuallyBeforeTimingOutAfter(10.0)] equal:theValue(0)];
        });
        
    });


SPEC_END