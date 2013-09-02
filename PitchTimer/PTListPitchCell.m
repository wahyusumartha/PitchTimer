//
//  PTListPitchCell.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/10/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTListPitchCell.h"
#import <FlatUIKit/UIFont+FlatUI.h>
#import <FlatUIKit/UIColor+FlatUI.h>


@interface PTListPitchCell()

/*
 *  Setup User Interface For Each Of Cell
 */
- (void)setupCellUI;

@end

@implementation PTListPitchCell

@synthesize titleLabel;
@synthesize pitchDurationLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setupCellUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Private Methods 
- (void)setupCellUI
{
    [self.contentView setBackgroundColor:[UIColor greenSeaColor]];
    
    // configure or setup title label component
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 15, 270, 25)];
    [self.titleLabel setFont:[UIFont boldFlatFontOfSize:23]];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setText:@"This is my first Pitch"];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.titleLabel];
    
    // configure or setup pitchDurationLabel Component
    self.pitchDurationLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 63, 270, 15)];
    [self.pitchDurationLabel setFont:[UIFont flatFontOfSize:13]];
    [self.pitchDurationLabel setTextColor:[UIColor whiteColor]];
    [self.pitchDurationLabel setText:@"12m15s"];
    [self.pitchDurationLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.pitchDurationLabel];
}

@end
