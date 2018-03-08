//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "BuddyTransactionEvent.h"

@implementation BuddyTransactionEvent

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
