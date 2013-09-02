//
//  PTNewPitchViewController.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 9/2/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTNewPitchViewController.h"

@interface PTNewPitchViewController ()

@end

@implementation PTNewPitchViewController

@synthesize companyNameTextField;
@synthesize productNameTextField;
@synthesize targetAudienceTextField;
@synthesize problemToSolvedTextField;
@synthesize solutionTextField;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
