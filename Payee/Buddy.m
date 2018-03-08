//
//  Buddy.m
//  MidtermStarterFile
//
//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "Buddy.h"

@implementation Buddy

-(instancetype)initWithBuddyName: (NSString*)buddyName
{
  self = [super init];
  if(self)
  {
    _buddyName = buddyName;
  }
  return self;
}

-(instancetype)init
{
  self = [self initWithBuddyName:@"Defaulty D. McDefaultyton"];
  return self;
}

@end
