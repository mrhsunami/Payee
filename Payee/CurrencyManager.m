//
//  CurrencyManager.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-11.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "CurrencyManager.h"

@interface CurrencyManager ()

@property (nonatomic) NSURL *currencyAPIURL;

@end

@implementation CurrencyManager

-(void)getExchangeRates
{
  NSURLSessionDataTask *getExchangeRatesTask = [[NSURLSession sharedSession] dataTaskWithURL: self.currencyAPIURL
                                                                           completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
  {
        NSLog(@"Fetching data from CurrencyLayer");
        if (error != nil)
        {
          return;
        }
        [self parseResponseData:data];
      }];
  
  [getExchangeRatesTask resume]
  print(
  ;
}

-(void)parseResponseData: (NSData*)data
{
  NSError *error = nil;
  id jsonObject = [NSJSONSerialization JSONObjectWithData: data
                                                  options: 0
                                                    error: &error];
  if(error != nil)
  {
    return;
  }
  
  if([jsonObject isKindOfClass: [NSDictionary class]])
  {
    dispatch_async(dispatch_get_main_queue(),
     ^{
       _currenciesList = (NSDictionary *)jsonObject;
     });
    return;
  }
}

-(instancetype)init
{
  self = [super init];
  if(self)
  {
    _currencyAPIURL = [NSURL URLWithString:@"https://www.apilayer.net/api/live?access_key=af1a59d17cc5ca3c64913ea15beba024"];
    [self getExchangeRates];
  }
  return self;
}

@end
