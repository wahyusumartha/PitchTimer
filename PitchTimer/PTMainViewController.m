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

@interface PTMainViewController () <PTScreenTimerDelegate>

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
    
    // Start The Timer
    self.screenTimer = [[PTScreenTimer alloc] init];
    [self.screenTimer setDelegate:self];
    [self.screenTimer startTimer:10];
    
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
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setBackgroundColor:[UIColor redColor]];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didStartTimer
{
    [self.countdownLabel setText:@"10"];
    
    // set background color to green
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setBackgroundColor:[UIColor greenColor]];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveTimerWarningState
{
    // set background color to orange
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setBackgroundColor:[UIColor orangeColor]];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)countingDown:(NSInteger)remainingTime
{
    DLog(@"Remaining Time : %d", remainingTime);
    [self.countdownLabel setText:[NSString stringWithFormat:@"%d", remainingTime]];
}

@end
