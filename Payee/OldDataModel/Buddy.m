//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "Buddy.h"

@implementation Buddy

-(instancetype)initWithBuddyName: (NSString*)name
{
  self = [super init];
  if(self)
  {
    
  }
  return self;
}

-(instancetype)initVirtualSummingBuddy
{
  self = [super init];
  if(self)
  {
    _buddyName = @"Name";
  }
  return self;
}

@end
