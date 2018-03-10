//
//  Trip.h
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import <Realm/Realm.h>
#import "Buddy.h"
#import "Meal.h"
#import "LedgerLine.h"

@class Trip;


@protocol TripProtocol <NSObject>

@property (nonatomic, weak) Trip *activeTrip;
@property (nonatomic, weak) RLMRealm *database;

+(Trip*)returnLastAccessedTripOrInitNewInDatabase: (RLMObject*)database;

@end


@interface Trip : RLMObject

@property (nonatomic) NSString *tripName;
@property (nonatomic) NSDate *dateLastAccessed;
@property (nonatomic, weak) id <TripProtocol> delegate;

//-(Buddy*)newBuddyWithString: (NSString*)buddyName;
//-(NSArray*)currentBuddyList;
//-(void)addTransaction: ()

@end


