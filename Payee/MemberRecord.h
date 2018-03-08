//
//  MemberRecord.h
//  MidtermStarterFile
//
//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Buddy.h"

@interface MemberRecord : NSObject

@property (nonatomic) Buddy *buddy;
@property (nonatomic) float tabAmountCAD;
@property (nonatomic) float paidAmountCAD;

-(instancetype)initWithBuddy: (Buddy*)buddy
                tabAmountCAD: (float)tabAmountCAD
            andPaidAmountCAD: (float)paidAmountCAD;

@end
