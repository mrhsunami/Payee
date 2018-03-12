//
//  LedgerLine.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "LedgerLine.h"

@implementation LedgerLine

+(NSArray*)settleUpSummaryForTrip: (Trip*)trip
{
  RLMRealm *realm = [RLMRealm defaultRealm];
  RLMResults *buddies = [Buddy allObjects];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"trip == %@",trip ];
  RLMResults *ledgers = [LedgerLine objectsWithPredicate:predicate];
  NSMutableArray *buddySummaryArray = [[NSMutableArray alloc]init];
  for (Buddy *buddy in buddies)
  {
    float tabs = 0.00;
    float pays = 0.00;
    for (LedgerLine *ledger in ledgers)
    {
      if ([ledger.buddy isEqualToObject:buddy])
      {
        tabs += ledger.tab;
        pays += ledger.pay;
      }
    }
    NSArray *buddyLedgerSummary = @[buddy.buddyName,[NSNumber numberWithFloat:tabs], [NSNumber numberWithFloat:pays],[NSNumber numberWithFloat:(tabs-pays)]];
    [buddySummaryArray insertObject:buddyLedgerSummary atIndex:0];
  }
  return buddySummaryArray;
}

+(NSArray*)budListForTrip: (Trip*)trip
{
  RLMRealm *realm = [RLMRealm defaultRealm];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"trip == %@",trip ];
  RLMResults *results = [LedgerLine objectsWithPredicate:predicate];
  NSMutableArray *tripBuddies = [[NSMutableArray alloc]init];
  for (LedgerLine* result in results)
  {
    [tripBuddies addObject:result];
  }
  return tripBuddies;
}

+(void)clearLedger
{
  RLMRealm *realm = [RLMRealm defaultRealm];

  RLMResults *ledgers = [LedgerLine allObjects];
  RLMResults *meals = [Meal allObjects];
  RLMResults *buddies = [Buddy allObjects];
    [realm beginWriteTransaction];
  [realm deleteObjects:ledgers];
    [realm deleteObjects:meals];
    [realm deleteObjects:buddies];
     [realm commitWriteTransaction];
}

-(instancetype)initWithTrip: (Trip*)trip
                       meal: (Meal*)meal
                      buddy: (Buddy*)buddy
                        tab: (float)tab
                     andPay: (float)pay
{
  self = [super init];
  if(self)
  {
    _trip = trip;
    _meal = meal;
    _buddy = buddy;
    _tab = tab;
    _pay = pay;
    _date = [NSDate date];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:self];
    [realm commitWriteTransaction];
  }
  return self;
}

@end
