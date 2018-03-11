//
//  Meal.h
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "HeaderForObjC.h"

@interface Meal : RLMObject

@property (nonatomic) NSString* mealName;
@property (nonatomic) float totalExpense;

-(instancetype)initWithName: (NSString*)name
                 andExpense: (float)expense;

-(instancetype)initWithName: (NSString*)name;

@end
