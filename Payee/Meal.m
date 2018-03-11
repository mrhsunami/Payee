//
//  Meal.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "Buddy.h"
#import "Trip.h"
#import "Meal.h"
#import "Realm/Realm.h"

@implementation Meal

-(instancetype)initWithName: (NSString*)name
                 andExpense: (float)expense
{
  self = [super init];
  if(self)
  {
    _mealName = name;
    _totalExpense = expense;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:self];
    [realm commitWriteTransaction];
  }
  return self;
}

-(instancetype)initWithName: (NSString*)name
{
  self = [self initWithName:name andExpense:0.00];
  return self;
}

-(instancetype)init
{
  self = [self initWithName:@"<default>"];
  return self;
}

@end
