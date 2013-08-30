//
//  PTListPitchCell.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/10/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import "PTListPitchCell.h"

@interface PTListPitchCellOwner : NSObject

@end

@implementation PTListPitchCellOwner


@end



@implementation PTListPitchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
