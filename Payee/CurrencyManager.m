//
//  CurrencyManager.m
//  Payee
//
//  Created by Chris Eloranta on 2018-03-11.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "CurrencyManager.h"
#import <Realm/Realm.h>
#import "ConversionRate.h"

@interface CurrencyManager ()

@property (nonatomic) NSString *baseCurrency;
@property (nonatomic) NSArray *ArrayOfCurrencies;
@property (nonatomic) NSURL *currencyAPIURL;

@end

@implementation CurrencyManager

+(double)convert: (float)foreignValue
            from: (NSString*)foreignCurrency
              to: (NSString*)baseCurrency
{
  RLMRealm *realm = [RLMRealm defaultRealm];
  NSPredicate *base = [NSPredicate predicateWithFormat:@"currency == %@",baseCurrency];
  NSPredicate *foreign = [NSPredicate predicateWithFormat:@"currency == %@",foreignCurrency];
  RLMResults *baseResults = [ConversionRate objectsWithPredicate:(base)];
  RLMResults *foreignResults = [ConversionRate objectsWithPredicate:(foreign)];
  ConversionRate *baseCurrencyObject = [baseResults firstObject]; //eventually should return most recent object with matching currency
  ConversionRate *foreignCurrencyObject = [foreignResults firstObject];//eventually should return most recent object with matching currency
  double conversionFactor = baseCurrencyObject.USDConversion / foreignCurrencyObject.USDConversion;
  return conversionFactor * foreignValue;
}

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

       NSDictionary * downloadedDictionary = (NSDictionary *)jsonObject;
       NSDictionary * currencyConversions = downloadedDictionary[@"quotes"];
       RLMRealm *realm = [RLMRealm defaultRealm];
       [realm beginWriteTransaction];
       for(id key in currencyConversions)
       {
         NSString *currencyRaw = (NSString*)key;
         NSNumber *conversion = (NSNumber*)currencyConversions[currencyRaw];
         NSString *currency = [currencyRaw substringFromIndex:3];
         double conversionValue = [conversion doubleValue];
         [[ConversionRate alloc]initWithString:currency andConversionRate:conversionValue];
         self.ArrayOfCurrencies = [currencyConversions allKeys];
         
          }
       [realm commitWriteTransaction];
     });
      return;
  }
}

-(instancetype)initWithBaseCurrency: (NSString*)baseCurrency
{
  self = [super init];
  if(self)
  {
    _currencyAPIURL = [NSURL URLWithString:@"https://www.apilayer.net/api/live?access_key=af1a59d17cc5ca3c64913ea15beba024"];
    _baseCurrency = baseCurrency;
    [self getExchangeRates];
  }
  return self;
}

-(instancetype)init
{
  self = [self initWithBaseCurrency:@"CAD"];
  return self;
}

@end
