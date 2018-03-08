//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "TransactionRecord.h"

@implementation TransactionRecord


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
