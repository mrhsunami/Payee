//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Buddy.h"

@interface BuddyTransactionEvent : NSObject

@property (nonatomic) Buddy* buddy;
@property (nonatomic) float tabAmountCAD;
@property (nonatomic) float paidAmountCAD;

+(instancetype)returnSumOfEvents:(BuddyTransactionEvent*)event1
                             and:(BuddyTransactionEvent*)event2;

+(instancetype)returnSumOfEventsArray:(NSArray<BuddyTransactionEvent*>*)array
                             forBuddy:(Buddy*)buddy;

+(instancetype)returnSumOfEventsArray:(NSArray<BuddyTransactionEvent*>*)array;

-(instancetype)initWithBuddy: (Buddy*)buddy
                tabAmountCAD: (float)tabAmountCAD
            andPaidAmountCAD: (float)paidAmountCAD;

-(instancetype)initNetZeroWithBuddy: (Buddy*)buddy;

-(void)sumWithBuddyTransactionEvent: (BuddyTransactionEvent*)event;

-(void)sumWithBuddyTransactionEvent:(BuddyTransactionEvent *)event
                          ifBuddyIs: (Buddy*)buddy;

@end

