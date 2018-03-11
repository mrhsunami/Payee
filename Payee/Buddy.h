//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Buddy : RLMObject

@property (nonatomic) NSString *buddyName;


+(NSArray<Buddy*>*)budList;
+(Buddy*)newOrMatchingNameString: (NSString*)name;

-(instancetype)initWithBuddyName: (NSString*)buddyName;


// to be deleted in new data model
-(instancetype)initVirtualSummingBuddy;

@end
