//
//  ConversionRate.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-11.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "ConversionRate.h"
#import <Realm/Realm.h>

@implementation ConversionRate

-(instancetype)initWithString: (NSString*)currenciesConverted
            andConversionRate: (double)USDConversionRate
{
  self = [super init];
  if(self)
  {
    _currency = currenciesConverted;
    _USDConversion = USDConversionRate;
    _date = [NSDate date];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm addObject:self];
  }
  return self;
}
@end
