//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "TransactionRecord.h"

@implementation TransactionRecord

+(float)getTabPayOrNet: (NSString*)figure
              forBuddy: (Buddy*)buddy
  fromTransactionArray: (NSArray<TransactionRecord*>*)array
{
TransactionRecord* sumOfRecords = [TransactionRecord sumTransactionsFromArray:array];
  BuddyTransactionEvent* thisEvent = [BuddyTransactionEvent returnSumOfEventsArray:sumOfRecords.buddyTransactionEvents forBuddy:buddy];
  float paid = thisEvent.paidAmountCAD;
  float tab = thisEvent.tabAmountCAD;
  float net = paid-tab;
  float returnAnswer;
  if ([figure isEqualToString:@"Tab"])
  {
    returnAnswer = tab;
  }
  else if ([figure isEqualToString:@"Pay"])
  {
    returnAnswer = paid;
  }
  else if([figure isEqualToString:@"Net"])
  {
    returnAnswer = net;
  }
  else returnAnswer = 0;
  return returnAnswer;
}

+(TransactionRecord*)sumTransactionsFromArray: (NSArray<TransactionRecord*>*)inputArray
{
  NSMutableSet* buddySet = [[NSMutableSet alloc]init];
  for (TransactionRecord* transaction in inputArray)
  {
    NSArray *eventsArray = transaction.buddyTransactionEvents;
    for (BuddyTransactionEvent* event in eventsArray)
    {
      [buddySet addObject:event.buddy];
    }
  }
  NSMutableArray<BuddyTransactionEvent*>* eventsArray2 = [[NSMutableArray alloc]init];

    for(TransactionRecord* transaction in inputArray)
    {
      for(BuddyTransactionEvent* event in transaction.buddyTransactionEvents)
      {
        [eventsArray2 addObject:event];
      }
    }
  NSMutableArray *eventArrayForTransaction = [[NSMutableArray alloc]init];
  for (Buddy* buddy in buddySet)
  {
    BuddyTransactionEvent *event = [BuddyTransactionEvent returnSumOfEventsArray:eventsArray2 forBuddy:buddy];
    [eventArrayForTransaction addObject:event];
   }
      TransactionRecord* returnTransaction = [[TransactionRecord alloc]initWithName:@"VirtualSumTransaction" date:[NSDate date] andBuddyTransactionEvents:eventArrayForTransaction];
  return returnTransaction;
}


//MARK: Convenience Methods

//This method allows addition of all value properties of the instance in the selector to the receiver's properties
//See further below for a method which creates a zeroed TransactionRecord as a base for iterated addition

-(void)sumWithTransactionRecord: (TransactionRecord*)transactionToAdd
{
  for (BuddyTransactionEvent* event in self.buddyTransactionEvents)
       {
         for (BuddyTransactionEvent* eventToAdd in transactionToAdd.buddyTransactionEvents)
         {
           [event sumWithBuddyTransactionEvent:eventToAdd ifBuddyIs:event.buddy];
         }
       }
}

//MARK: Initializer methods and overrides
-(instancetype)initWithName: (NSString*)name
                       date: (NSDate*)date
  andBuddyTransactionEvents: (NSArray*)buddyTransactionEvents
{
  self = [super init];
  if(self)
  {
    _transactionName = name;
    _transactionDate = date;
    _buddyTransactionEvents = buddyTransactionEvents;
  }
  return self;
}

//This method creates a zeroed Transaction record from an array of buddy objects.
//This should be used to create a 'blank' record, to which other records can be added
//during iteration

-(instancetype)initZeroedTransactionRecordFromBuddyArray: (NSArray<Buddy*>*)buddyArray
{
  self = [self initWithName:@"SummingTransaction"
                       date:[NSDate date]
  andBuddyTransactionEvents:[[NSArray alloc]init]];
  NSMutableArray *newArray = [[NSMutableArray alloc]init];
  for (Buddy* buddy in buddyArray)
  {
    BuddyTransactionEvent* newEvent =  [[BuddyTransactionEvent alloc]initNetZeroWithBuddy:buddy];
    [newArray addObject:newEvent];
  }
  _buddyTransactionEvents = newArray;
  
  return self;
  
}

@end
