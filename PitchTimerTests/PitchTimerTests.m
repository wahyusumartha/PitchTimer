//
//  PitchTimerTests.m
//  PitchTimerTests
//
//  Created by Wahyu Sumartha  on 8/9/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PitchTimerTests.h"

#import "PTScreenTimer.h"

@implementation PitchTimerTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    _screenTimer = [[PTScreenTimer alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    _screenTimer = nil;
    
    [super tearDown];
}

- (void)testIfTimerIsInitialized
{
    [_screenTimer startTimer:10];
    STAssertNotNil(_screenTimer.timer, @"Timer should not be nil");
    sleep(5);
}

@end