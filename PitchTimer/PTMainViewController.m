//
//  PTMainViewController.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/9/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTMainViewController.h"

#import "PTScreenTimer.h"
#import "PTMacro.h"

#define MINUTES_TO_SECONDS(MINUTES) (MINUTES * 60)
#define DURATION_OF_COLOR_TRANSITION 0.5

@interface PTMainViewController () <PTScreenTimerDelegate>
- (void)setupGesture;
@end

@implementation PTMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // setup title
    [self setTitle:@"Record Your Pitch"];
    
    // setup Gesture
    [self setupGesture];
    
    // Start The Timer
    self.screenTimer = [[PTScreenTimer alloc] init];
    [self.screenTimer setDelegate:self];
    [self.screenTimer startTimer:MINUTES_TO_SECONDS(0.25)];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.screenTimer stopTimer];
    [self.screenTimer setDelegate:nil];
    self.screenTimer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PTScreenTimer Delegate 
- (void)didStopTimer
{
    // set background color to red
    [UIView animateWithDuration:DURATION_OF_COLOR_TRANSITION delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setBackgroundColor:[UIColor colorWithRed:231/255.f green:74/255.f blue:126/255.f alpha:1.0]];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didStartTimer
{
    
    // set background color to green
    [UIView animateWithDuration:DURATION_OF_COLOR_TRANSITION delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setBackgroundColor:[UIColor colorWithRed:31/255.f green:187/255.f blue:166/255.f alpha:1.0]];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveTimerWarningState
{
    // set background color to orange
    [UIView animateWithDuration:DURATION_OF_COLOR_TRANSITION delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setBackgroundColor:[UIColor colorWithRed:242/255.f green:121/255.f blue:53/255.f alpha:1.0]];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)countingDown:(NSInteger)remainingTime
{
    DLog(@"Remaining Time : %d", remainingTime);
    [self.countdownLabel setText:[self convertToString:remainingTime]];
}

#pragma mark - Private Methods 
- (void)setupGesture
{
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startOrPauseTimer:)];
    self.tapGesture.numberOfTouchesRequired = 1;
    self.tapGesture.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:self.tapGesture];
}

- (NSString *)convertToString:(NSInteger)remainingTime
{
    int second = remainingTime % 60;
    int minutes = (remainingTime / 60) < 60 ? (remainingTime / 60) : (remainingTime/60) - 60;
    int hours = (remainingTime / 60) / 60;
    
    NSString *stringFormat = [NSString stringWithFormat:@"%d : %d : %d", hours, minutes, second];
    
    return stringFormat;
}

#pragma mark - Start or Pause Timer 
- (void)startOrPauseTimer:(id)sender
{
    if (self.screenTimer.timer) {
        [self.screenTimer pauseTimer];
    } else {
        [self.screenTimer resumeTimer];
    }
}

@end
