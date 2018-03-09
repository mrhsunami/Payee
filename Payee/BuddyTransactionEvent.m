//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "BuddyTransactionEvent.h"

@implementation BuddyTransactionEvent

+(instancetype)returnSumOfEvents:(BuddyTransactionEvent*)event1
                             and:(BuddyTransactionEvent*)event2
{
  Buddy* virtualSummingBuddy = [[Buddy alloc]initVirtualSummingBuddy];
  BuddyTransactionEvent *summedEvent = [[BuddyTransactionEvent alloc]initWithBuddy:virtualSummingBuddy
                                                                       tabAmountCAD:0.0
                                                                   andPaidAmountCAD:0.0];
  summedEvent.tabAmountCAD = event1.tabAmountCAD + event2.tabAmountCAD;
  summedEvent.paidAmountCAD = event1.paidAmountCAD + event2.paidAmountCAD;
  return summedEvent;
}

+(instancetype)returnSumOfEventsArray:(NSArray<BuddyTransactionEvent*>*)array
                             forBuddy:(Buddy*)buddy
{
  BuddyTransactionEvent* virtualSummingEvent = [[self alloc]initWithBuddy:buddy tabAmountCAD:0.0 andPaidAmountCAD:0.0];
  for (BuddyTransactionEvent* event in array)
  {
    //this probably needs to be a "is equal to" method, not '=='
    if ([event.buddy.buddyName isEqualToString:buddy.buddyName])
    {
      virtualSummingEvent = [self returnSumOfEvents:virtualSummingEvent and:event];
    }
      
  }
  return virtualSummingEvent;
}

+(instancetype)returnSumOfEventsArray:(NSArray<BuddyTransactionEvent*>*)array
{
  Buddy* virtualSummingBuddy = [[Buddy alloc]initVirtualSummingBuddy];
  BuddyTransactionEvent* virtualSummingEvent = [[BuddyTransactionEvent alloc]initNetZeroWithBuddy:virtualSummingBuddy];
  for (BuddyTransactionEvent* event in array)
  {
    virtualSummingEvent = [self returnSumOfEvents:event and:virtualSummingEvent];
  }
  return virtualSummingEvent;
}


+(NSArray<BuddyTransactionEvent*>*)returnSumOfEventsInArray:(NSArray<BuddyTransactionEvent*>*)events
{
  NSMutableSet* buddySet = [[NSMutableSet alloc]init];
  NSMutableArray* eventArray = [[NSMutableArray alloc]init];
  
  for (BuddyTransactionEvent* event in events)
  {
    [buddySet addObject:event.buddy];
  }
  for (Buddy* buddy in buddySet)
  {
    BuddyTransactionEvent* summingEvent = [self returnSumOfEventsArray:events forBuddy:buddy];
    [eventArray addObject:summingEvent];
  }
  return eventArray;
}

//MARK: Convenience Methods

//Adds the value properties of the object in the selector to the value properties of the receiver
//See further below for a method to create a zero-balance event to be used as a base for
//adding using iteration

-(void)sumWithBuddyTransactionEvent: (BuddyTransactionEvent*)event
{
  self.paidAmountCAD += event.paidAmountCAD;
  self.tabAmountCAD += event.tabAmountCAD;
}

//Adds the value properties of the object in the selector to the value properties of the receiver
//but only if the buddy object in the selector matches the buddy object in the receiver.
//Allows iteration through a list of transactions while summing together one buddy's records

-(void)sumWithBuddyTransactionEvent:(BuddyTransactionEvent *)event
                          ifBuddyIs: (Buddy*)buddy
{
  if([event.buddy isEqual:buddy])
  {
    [self sumWithBuddyTransactionEvent:event];
  }
}

//MARK: initializer methods and overrides

-(instancetype)initWithBuddy: (Buddy*)buddy
                tabAmountCAD: (float)tabAmountCAD
            andPaidAmountCAD: (float)paidAmountCAD
{
  self = [super init];
  if(self)
  {
    _buddy = buddy;
    _tabAmountCAD = tabAmountCAD;
    _paidAmountCAD = paidAmountCAD;
  }
  return self;
}

//This method creates a zero-balance transaction event from a buddy instance

-(instancetype)initNetZeroWithBuddy: (Buddy*)buddy
{
  self = [self initWithBuddy:buddy tabAmountCAD:0.00 andPaidAmountCAD:0.00];
  return self;
}

-(instancetype)init
{
  Buddy *noBuddy = [[Buddy alloc]init];
  self = [self initWithBuddy:noBuddy tabAmountCAD:0.00 andPaidAmountCAD:0.00];
  return self;
}

@end
