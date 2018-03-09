//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Buddy : RLMObject

@property (nonatomic) NSString *buddyName;

-(instancetype)initWithBuddyName: (NSString*)buddyName;

-(instancetype)initVirtualSummingBuddy;

@end
