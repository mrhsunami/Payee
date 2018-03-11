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

+(Trip*)LastAccessedTripOrInitNewInDatabase
{
  RLMRealm *realm = [RLMRealm defaultRealm];
  RLMResults<Trip*> *trips = [Trip allObjects];
  Trip *newTrip = [[Trip alloc]initFirstTrip];
  Trip *currentTrip;
  if([realm isEmpty])
  {
    [realm beginWriteTransaction];
    [realm addObject:newTrip];
    [realm commitWriteTransaction];
    return newTrip;
  }
  else if (trips.count == 1)
  {
    return [trips firstObject];
  }
  else
  {

    RLMResults* results = [Trip allObjectsInRealm:realm];
    NSDate *mostRecentEdit = [results maxOfProperty:@"dateLastAccessed"];
    for(Trip *trip in results)
    {
      if (trip.dateLastAccessed == mostRecentEdit)
      {currentTrip = trip;
      }
    }
    [currentTrip updateDateLastAccessed];
    return currentTrip;
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

-(instancetype)init{
  self = [self initWithName:@"defaultName"];
  return self;
}
@end
