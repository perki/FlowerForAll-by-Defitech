//
//  BlowHistory.m
//  FlowerForAll
//
//  Created by Pierre-Mikael Legris (Perki) on 31.08.11.
//  Copyright 2011 fondation Defitech. All rights reserved.
//

#import "BlowHistory.h"
#import "DB.h"
#import "FLAPIBlow.h"
#import "FLAPIX.h"

@implementation BlowHistory

- (id)initWithDuration:(int)duration_m delegate:(id)blowHistoryDelegate
{
    self = [super init];
    if (self) {
        [self setDuration:duration_m];
        // Listen to FLAPIX blowEvents
        [[NSNotificationCenter defaultCenter] 
         addObserver:self 
         selector:@selector(flapixEventEndBlow:) 
         name:FLAPIX_EVENT_BLOW_STOP object:nil];
        delegate = blowHistoryDelegate;
    }
    
    return self;
}

-(BOOL) setDuration:(int)duration_m {
    if (duration_m < 1) return NO;
    duration_s = duration_m * 60;
    if (history == nil) {
        history = [[NSMutableArray alloc] init ];
    }
    
    return YES;
}

-(void) reloadFromDB {
    // empty history and fill it with data from the DB
    [history removeAllObjects];
    [DB fillWithBlows:history fromTimestamp:(CFAbsoluteTimeGetCurrent() - duration_s)];
}

-(void) flapixEventEndBlow:(NSNotification *)notification {
    @synchronized(history) {
        [history addObject:[notification object]];
        
        while ([history count] > 0 &&
               [(FLAPIBlow*)[history objectAtIndex:0] timestamp] < (CFAbsoluteTimeGetCurrent() - duration_s)) {
            [history removeObjectAtIndex:0];
        }
    }
    if (delegate != nil) {
        [delegate  historyChange:(id*)self];
    }
}

-(NSMutableArray*) getHistoryArray {
    return history;
}

/** will return a min of 1second if empty or lower than 6Hz **/
-(double) longestDuration {
    double max = 6.0f;
    for (FLAPIBlow* blow in history) {
        if (blow.duration > max) max = blow.duration;
    }
    return max;
}

- (void) dealloc
{
    [history release];
    [super dealloc];
}

@end
