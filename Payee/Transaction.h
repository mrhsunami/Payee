//
//  Transaction.h
//  MidtermStarterFile
//
//  Created by Chris Eloranta on 2018-03-07.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Buddy.h"
#import "MemberRecord.h"

@interface Transaction : NSObject

@property (nonatomic) NSString *transactionName;
@property (nonatomic) NSDate  *transactionDate;
@property (nonatomic) NSArray *memberRecords;

// some future stuff:
// @property (nonatomic) NSString *vendorName;
// @property (nonatomic) int *transactionNumber;
// @property (nonatomic) UIImage *receiptImage

-(instancetype)initWithName: (NSString*)name
                       date: (NSDate*)date
            andMemberRecords: (NSArray*) memberRecords;

@end
