//
//  PTMainViewController.h
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/9/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTScreenTimer;
@interface PTMainViewController : UIViewController

/*
 * Instance Variable that associated with PTScreenTimer
 */
@property (nonatomic, strong) PTScreenTimer *screenTimer;
/*
 *  Instance Variable that associated with label in Interface Builder
 */
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
/*
 * An object to use tap Gesture for Start or Pause The Timer
 */
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@end
