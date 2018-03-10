//
//  Trip.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "Trip.h"
@interface Trip ()

@end

@implementation Trip

+(Trip*)returnLastAccessedTripOrInitNewInDatabase
{
//  RLMRealm *realm = [RLMRealm defaultRealm];
//  RLMResults<Trip *><Trip> = +[Trip AllObjects];
  
  if(FALSE)
  {

  }
  else
  {
    Trip *newTrip = [[Trip alloc]initFirstTrip];
    return newTrip;
  }
}

//+[Trip allObjects],

-(void)updateDateLastAccessed
{
  self.dateLastAccessed = [NSDate date];
}

-(instancetype)initWithName: (NSString*)name
{
  self = [super init];
  if(self)
  {
    _tripName = name;
    _dateLastAccessed = [NSDate date];
  }
  return self;
}
     
-(instancetype)initFirstTrip
{
  self = [self initWithName:@"Our Amazing Trip"];
  return self;
}
@end
