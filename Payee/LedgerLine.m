//
//  LedgerLine.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "LedgerLine.h"

@implementation LedgerLine

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
