//
//  LedgerLine.h
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "Realm/Realm.h"
#import "Trip.h"
#import "Meal.h"
#import "Buddy.h"

@interface LedgerLine : RLMObject

@property (nonatomic) Trip* trip;
@property (nonatomic) Meal* meal;
@property (nonatomic) Buddy* buddy;
@property (nonatomic) float tab;
@property (nonatomic) float pay;
@property (nonatomic) NSDate *date;

-(instancetype)initWithTrip: (Trip*)trip
                       meal: (Meal*)meal
                      buddy: (Buddy*)buddy
                        tab: (float)tab
                     andPay: (float)pay;

@end
