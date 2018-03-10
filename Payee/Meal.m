//
//  Meal.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "Meal.h"

@implementation Meal

-(instancetype)initWithName: (NSString*)name
{
  self = [self init];
  if(self)
  {
    _mealName = name;
  }
  return self;
}

-(instancetype)init
{
  self = [super init];
  if(self)
  {
    _mealId = [[NSUUID alloc]init];
  }
  return self;
}

@end
