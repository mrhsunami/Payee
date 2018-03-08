//
//  MemberRecord.m
//  MidtermStarterFile
//
//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "MemberRecord.h"

@implementation MemberRecord

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

-(instancetype)initWithBuddy: (Buddy*)buddy
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
