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

//NS_ASSUME_NONNULL_BEGIN
//NS_ASSUME_NONNULL_END

+(TransactionRecord*)sumTransactionsFromArray: (NSArray<TransactionRecord*>*)inputArray;

+(float)getTabPayOrNet: (NSString*)figure
              forBuddy: (Buddy*)buddy
  fromTransactionArray: (NSArray<TransactionRecord*>*)array;


-(void)sumWithTransactionRecord: (TransactionRecord*)transactionToAdd;

-(instancetype)initWithName: (NSString*)name
                       date: (NSDate*)date
  andBuddyTransactionEvents: (NSArray*)buddyTransactionEvents;

-(instancetype)initZeroedTransactionRecordFromBuddyArray: (NSArray<Buddy*>*)buddyArray;

@end

