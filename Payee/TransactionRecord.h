//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Buddy.h"
#import "BuddyTransactionEvent.h"

@interface TransactionRecord : NSObject

@property (nonatomic) NSString *transactionName;
@property (nonatomic) NSDate  *transactionDate;
@property (nonatomic) NSArray *buddyTransactionEvents;


-(void)sumWithTransactionRecord: (TransactionRecord*)transactionToAdd;

-(instancetype)initWithName: (NSString*)name
                       date: (NSDate*)date
  andBuddyTransactionEvents: (NSArray*)buddyTransactionEvents;

-(instancetype)initZeroedTransactionRecordFromBuddyArray: (NSArray<Buddy*>*)buddyArray;

@end
