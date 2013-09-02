//
//  PTSettingViewController.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 9/2/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTSettingViewController.h"
#import "PTMacro.h"
#import <FlatUIKit/UITableViewCell+FlatUI.h>
#import <FlatUIKit/UIColor+FlatUI.h>
#import <FlatUIKit/UIFont+FlatUI.h>

@interface PTSettingViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *settingsArray;
}

/*
 *  Table View which contains of Available Setting
 */
@property (strong, nonatomic) UITableView *settingsTableView;

@end

@implementation PTSettingViewController

@synthesize settingsTableView;

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

    // initialize setting array
    settingsArray = [NSArray arrayWithObjects:@"Send Feeback", @"Help & Support", @"Review", nil];
    
    // set view controller title
    [self setTitle:@"Setting"];
    
    // set setting table view to view controller ui hierarchy
    self.settingsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.settingsTableView setDelegate:self];
    [self.settingsTableView setDataSource:self];
    [self.view addSubview:self.settingsTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"Cell Selected : %d", indexPath.row);
    
}

#pragma mark - UITableView Datasource 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SettingCellIdentifier = @"SettingCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SettingCellIdentifier];
    
    if (!cell) {
        cell = [UITableViewCell configureFlatCellWithColor:[UIColor greenSeaColor] selectedColor:[UIColor cloudsColor] style:UITableViewCellStyleDefault reuseIdentifier:SettingCellIdentifier];
    }
    
    [cell.textLabel setText:[settingsArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


@end
