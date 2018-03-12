//
//  CurrencyManager.h
//  Payee
//
//  Created by Chris Eloranta on 2018-03-11.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConversionRate.h"

@interface CurrencyManager : NSObject

@property (nonatomic) NSArray *ArrayOfCurrencies;

+(double)convert: (float)foreignValue
              from: (NSString*)foreignCurrency
              to: (NSString*)baseCurrency;


@end
