//
//  PTListPitchViewController.h
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/10/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTListPitchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

/*
 *  An object that associated with UITableView in Interface Builder 
 */
@property (weak, nonatomic) IBOutlet UITableView *pitchTableView;

/**
 * An UIBarButtonItem to go to store screen
 */
@property (strong, nonatomic) UIBarButtonItem *storeBarButtonItem;
/**
 *  An UIBarButtonItem to go to setting screen
 */
@property (strong, nonatomic) UIBarButtonItem *settingBarButtonItem;

@end
