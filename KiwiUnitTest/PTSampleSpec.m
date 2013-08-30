//
//  PTSampleSpec.m
//  PitchTimer
//
//  Created by Wahyu Sumartha  on 8/29/13.
//  Copyright (c) 2013 Wahyu Sumartha. All rights reserved.
//

#import <Kiwi/Kiwi.h>

SPEC_BEGIN(MathSpec)

describe(@"Math", ^{

    context(@"When Do Plus Calculation", ^{
        
        it(@"should equal 12", ^{
            NSInteger a = 6;
            NSInteger b = 6;
            [[theValue(a+b) should] equal:theValue(12)];
        });
        
    });
    
});

SPEC_END
