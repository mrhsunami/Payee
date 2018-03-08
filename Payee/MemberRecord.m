//
//  MemberRecord.m
//  MidtermStarterFile
//
//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "MemberRecord.h"

@implementation MemberRecord

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

@end
