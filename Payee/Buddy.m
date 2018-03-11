//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "Buddy.h"

@implementation Buddy


+(NSArray*)budList
{
  RLMRealm *realm = [RLMRealm defaultRealm];
  RLMResults *buddies = [Buddy allObjects];
  NSMutableArray *array = [[NSMutableArray alloc]init];
  for (Buddy *buddy in buddies)
  {
    [array addObject:buddy];
  }
  return array;
}

+(Buddy*)newOrMatchingNameString: (NSString*)name
{
  Buddy *returnBuddy;
  RLMRealm *realm = [RLMRealm defaultRealm];
  RLMResults *results = [Buddy objectsWhere:@"buddyName == %@",name];
  if(results.count > 0)
  {
    returnBuddy = [results firstObject];
  }
  else
  {
    returnBuddy = [[Buddy alloc]initWithBuddyName:name];
  }
  return returnBuddy;
}

//MARK: initializer methods
-(instancetype)initWithBuddyName: (NSString*)buddyName
{
  self = [super init];
  if(self)
  {
    _buddyName = buddyName;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:self];
    [realm commitWriteTransaction];
  }
  return self;
}

-(instancetype)init
{
  self = [self initWithBuddyName:@"Defaulty D. McDefaultyton"];
  return self;
}

-(instancetype)initVirtualSummingBuddy
{
  self = [self initWithBuddyName:@"VirtualSummingBuddy"];
  return self;
}

@end
