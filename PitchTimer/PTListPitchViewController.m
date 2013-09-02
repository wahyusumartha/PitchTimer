//
//  PTListPitchViewController.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/10/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTListPitchViewController.h"
#import "PTMacro.h"
#import "PTListPitchCell.h"
#import <FlatUIKit/UIColor+FlatUI.h>
#import "PTStoreViewController.h"
#import "PTSettingViewController.h"

@interface PTListPitchViewController ()

/*
 *  Open Store Screen
 */
- (void)openStoreScreen:(id)sender;
/*
 *  Open Setting Screen
 */
- (void)openSettingScreen:(id)sender;

@end

@implementation PTListPitchViewController

@synthesize storeBarButtonItem;
@synthesize settingBarButtonItem;

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
    
    // set view controller title as well as uinavigation bar title
    [self setTitle:@"My Pitch"];
    
    // setup uibarbuttonitem to ui hierarchy
    self.settingBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStyleBordered target:self action:@selector(openSettingScreen:)];
    [self.navigationItem setLeftBarButtonItem:self.settingBarButtonItem];
    
    self.storeBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Store" style:UIBarButtonItemStyleBordered target:self action:@selector(openStoreScreen:)];
    [self.navigationItem setRightBarButtonItem:self.storeBarButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"Tap Cell at Index : %d", indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88.f;
}

#pragma mark - UITableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPitchCell";
    
    PTListPitchCell *cell = (PTListPitchCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[PTListPitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return cell;
}

#pragma mark - Open Store Screen 
- (void)openStoreScreen:(id)sender
{
    PTStoreViewController *storeViewController = [[PTStoreViewController alloc] init];
    [self.navigationController pushViewController:storeViewController animated:YES];
}

#pragma mark - Open Setting Screen 
- (void)openSettingScreen:(id)sender
{
    PTSettingViewController *settingViewController = [[PTSettingViewController alloc] init];
    [self.navigationController pushViewController:settingViewController animated:YES];
}

@end
