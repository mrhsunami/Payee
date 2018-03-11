//
//  Trip.h
//  Payee
//
//  Created by Chris Eloranta on 2018-03-09.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "Realm/Realm.h"

@class Trip;

@protocol TripProtocol <NSObject>

@property (nonatomic)Trip *activeTrip;



@end


@interface Trip : RLMObject

@property (nonatomic) NSString *tripName;
@property (nonatomic) NSDate *dateLastAccessed;
// @property (nonatomic, weak) id <TripProtocol> delegate;

+(Trip*)LastAccessedTripOrInitNewInDatabase;

@end


