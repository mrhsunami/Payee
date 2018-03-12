//
//  ConversionRate.h
//  Payee
//
//  Created by Chris Eloranta on 2018-03-11.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "RLMObject.h"

@interface ConversionRate : RLMObject

@property (nonatomic) NSString *currency;
@property (nonatomic) double USDConversion;
@property (nonatomic) NSDate *date;

-(instancetype)initWithString: (NSString*)currenciesConverted
            andConversionRate: (double)USDConversionRate;

@end
