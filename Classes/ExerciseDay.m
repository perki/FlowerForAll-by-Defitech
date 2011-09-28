//
//  ExerciseDay.m
//  FlowerForAll
//
//  Created by dev on 20/09/11.
//  Copyright 2011 fondation Defitech. All rights reserved.
//

#import "ExerciseDay.h"

@implementation ExerciseDay

@synthesize date, formattedDate, order, good, bad;

- (id)init:(double)start_ts
{
    self = [super init];
    if (self) {
        self.date = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:start_ts];
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormatter setDateFormat:@"dd.MM.yyyy"];
        
        self.formattedDate = [dateFormatter stringFromDate:self.date];
        
        [dateFormatter release];
        
        self.order = @"";
    }
    
    return self;
}

@end
