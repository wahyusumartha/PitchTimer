//
//  PTStoreViewController.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 9/2/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTStoreViewController.h"
#import "PTMacro.h"
#import <FlatUIKit/UITableViewCell+FlatUI.h>
#import <FlatUIKit/UIFont+FlatUI.h>
#import <FlatUIKit/UIColor+FlatUI.h>
#import <FlatUIKit/FUIButton.h>


@interface PTStoreViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *dummyProductsArray;
}

/*
 *  UITableView for In App Purchase Product List
 */ 
@property (strong, nonatomic) UITableView *storeListTableView;
/*
 *  UILabel for In App Purchases Product Description
 */
@property (strong, nonatomic) UILabel *productDescriptionLabel;

@end

@implementation PTStoreViewController

@synthesize storeListTableView;
@synthesize productDescriptionLabel;

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
    
    dummyProductsArray = [NSArray arrayWithObjects:@"Remove Ads", @"Voice Recorder", @"Voice Speech", nil];

    
    // set navigation bar title as well as view controller title
    [self setTitle:@"Store"];
    
    // set viewcontroller background color
    [self.view setBackgroundColor:[UIColor midnightBlueColor]];
    
    // setup storeListTableView to ViewController UI Hierarchy
    self.storeListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 160) style:UITableViewStyleGrouped];
    [self.storeListTableView setDelegate:self];
    [self.storeListTableView setDataSource:self];
    [self.storeListTableView setScrollEnabled:NO];
    [self.view addSubview:self.storeListTableView];
    
    // setup productDescripitionLabel to ViewController UI Hierarchy
    CGFloat storeListTableViewHeight = (self.storeListTableView.frame.origin.y + self.storeListTableView.frame.size.width);
    
    self.productDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, storeListTableView.frame.origin.y + storeListTableView.frame.size.height, 300, [UIScreen mainScreen].bounds.size.height - storeListTableViewHeight)];
    [self.productDescriptionLabel setFont:[UIFont flatFontOfSize:15]];
    [self.productDescriptionLabel setNumberOfLines:0];
    [self.productDescriptionLabel setTextColor:[UIColor cloudsColor]];
    [self.productDescriptionLabel setTextAlignment:NSTextAlignmentLeft];
    [self.productDescriptionLabel setText:@"Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet Lorem Ipsum Dolor Amet"];
    [self.productDescriptionLabel setBackgroundColor:[UIColor midnightBlueColor]];
    [self.view addSubview:self.productDescriptionLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *StoreCellIdentifier = @"StoreCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:StoreCellIdentifier];
    
    FUIButton *purchaseButton = nil;
    
    if (!cell) {
        cell = [UITableViewCell configureFlatCellWithColor:[UIColor greenSeaColor] selectedColor:[UIColor cloudsColor] style:UITableViewCellStyleDefault reuseIdentifier:StoreCellIdentifier];
        
        purchaseButton = [[FUIButton alloc] initWithFrame:CGRectMake(245, 12, 50, 20)];
        [purchaseButton setButtonColor:[UIColor peterRiverColor]];
        [purchaseButton.titleLabel setFont:[UIFont boldFlatFontOfSize:13]];
        [purchaseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [purchaseButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [cell.contentView addSubview:purchaseButton];
        
    }
    
    [cell.textLabel setText:[dummyProductsArray objectAtIndex:indexPath.row]];
    
    [purchaseButton setTitle:@"$ 0.99" forState:UIControlStateNormal];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

#pragma mark - UITableView Delegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"Clicked : %d", indexPath.row);
    [self cellSelected:indexPath];
}

#pragma mark - Cell Selected 
- (void)cellSelected:(NSIndexPath *)indexPath
{
    NSString *stringSelected = [dummyProductsArray objectAtIndex:indexPath.row];
    
    [self.productDescriptionLabel setText:stringSelected];
}

@end
