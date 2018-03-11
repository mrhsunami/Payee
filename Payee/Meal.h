//
//  Meal.h
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "RLMObject.h"

@interface Meal : RLMObject

@property (nonatomic) NSString* mealName;


-(instancetype)initWithName: (NSString*)name;

@end
