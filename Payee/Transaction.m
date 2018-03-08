//
//  Transaction.m
//  MidtermStarterFile
//
//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

-(instancetype)initWithName: (NSString*)name
                       date: (NSDate*)date
           andMemberRecords: (NSArray*)memberRecords
{
  self = [super init];
  if(self)
  {
    _transactionName = name;
    _transactionDate = date;
    _memberRecords = memberRecords;
  }
  return self;
}

@end
