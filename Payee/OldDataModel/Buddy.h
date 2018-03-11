//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Buddy : NSObject

@property (nonatomic) NSString *buddyName;

-(instancetype)initWithBuddyName: (NSString*)name;
-(instancetype)initVirtualSummingBuddy;

@end
