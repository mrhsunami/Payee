//
//  DataModelTests.m
//  DataModelTests
//
//  Created by Chris Eloranta on 2018-03-08.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Buddy.h"
#import "BuddyTransactionEvent.h"
#import "TransactionRecord.h"
#import "Realm/Realm.h"
#import "Trip.h"

@interface DataModelTests : XCTestCase

@property (nonatomic) Buddy* buddy1;
@property (nonatomic) Buddy* buddy2;
@property (nonatomic) Buddy* buddy3;
@property (nonatomic) NSMutableArray* buddyArray;

@property (nonatomic) NSMutableArray* eventArray1;
@property (nonatomic) NSMutableArray* eventArray2;
@property (nonatomic) NSMutableArray* transactionArray;

@property (nonatomic) BuddyTransactionEvent* buddyEvent;
@property (nonatomic) TransactionRecord* transactionRecord;


@end

@implementation DataModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
  
  //Tests
  self.buddy1 = [[Buddy alloc]initWithBuddyName:@"Chris"];
  self.buddy2 = [[Buddy alloc]initWithBuddyName:@"Nathan"];
  self.buddy3 = [[Buddy alloc]initWithBuddyName:@"Kevin"];
  
  self.buddyArray = [[NSMutableArray alloc]init];
  [self.buddyArray addObject:self.buddy1];
  [self.buddyArray addObject:self.buddy2];
  [self.buddyArray addObject:self.buddy3];
  }

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
  BuddyTransactionEvent* event1 = [[BuddyTransactionEvent alloc]initNetZeroWithBuddy:self.buddy1];
  BuddyTransactionEvent* event2 = [[BuddyTransactionEvent alloc]initWithBuddy:self.buddy2
                                                                       tabAmountCAD:50.00 andPaidAmountCAD:0];
  BuddyTransactionEvent* event3 = [[BuddyTransactionEvent alloc]initWithBuddy:self.buddy3
                                                                      tabAmountCAD:30.00 andPaidAmountCAD:80.00];
  
  BuddyTransactionEvent* sum1 = [BuddyTransactionEvent returnSumOfEvents:event2 and:event3];
  
  BuddyTransactionEvent* event4 = [[BuddyTransactionEvent alloc]initWithBuddy:self.buddy1 tabAmountCAD:70 andPaidAmountCAD:200];
  BuddyTransactionEvent* event5 = [[BuddyTransactionEvent alloc]initWithBuddy:self.buddy2 tabAmountCAD:50.00 andPaidAmountCAD:0.0];
  BuddyTransactionEvent* event6 = [[BuddyTransactionEvent alloc]initWithBuddy:self.buddy3 tabAmountCAD:80.00
                                                                   andPaidAmountCAD:0];
  
  NSMutableArray* eventArray1 = [[NSMutableArray alloc]initWithObjects:event1, event2, event3, nil];
  NSMutableArray* eventArray2 = [[NSMutableArray alloc]initWithObjects:event4, event5, event6, nil];
  NSMutableArray* eventArray3 = [[NSMutableArray alloc]initWithArray:eventArray1];
  [eventArray3 addObjectsFromArray:eventArray2];
  
  BuddyTransactionEvent* array3buddy2Total = [BuddyTransactionEvent returnSumOfEventsArray:eventArray3 forBuddy:self.buddy2];
  BuddyTransactionEvent* array2Totals = [BuddyTransactionEvent returnSumOfEventsArray:eventArray2];
  
  TransactionRecord* transaction1 = [[TransactionRecord alloc]initWithName:@"Sun Sui Wah" date:[NSDate date] andBuddyTransactionEvents:eventArray1];
  TransactionRecord* transaction2 = [[TransactionRecord alloc]initWithName:@"Gotham Steakhouse" date:[NSDate date] andBuddyTransactionEvents:eventArray2];
  
  NSArray<TransactionRecord*> *transactionArray = [[NSArray alloc]initWithObjects:transaction1,transaction2, nil];
  
  float tab = [TransactionRecord getTabPayOrNet:@"Tab" forBuddy:self.buddy1 fromTransactionArray:transactionArray];
  float pay = [TransactionRecord getTabPayOrNet:@"Pay" forBuddy:self.buddy1 fromTransactionArray:transactionArray];
  float net = [TransactionRecord getTabPayOrNet:@"Net" forBuddy:self.buddy1 fromTransactionArray:transactionArray];
  
  
  //Test the class function for adding two buddyTransactionEvents
  XCTAssert(sum1.tabAmountCAD == 80.00);
  XCTAssert(sum1.paidAmountCAD == 80.00);
  
  //Test the class function for adding an array of buddyTransactionEvents
  XCTAssert(array2Totals.tabAmountCAD == 200);
  XCTAssert(array2Totals.paidAmountCAD == 200);
  
  //Test the class function for adding an array of buddyTransactionEvents filtered by buddy
  XCTAssert(array3buddy2Total.tabAmountCAD == 100);
  XCTAssert(array3buddy2Total.paidAmountCAD == 0);
  
  XCTAssert(tab == 70.00);
  XCTAssert(pay == 200.00);
  XCTAssert(net == -140);
  
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testTripAndRealm {
   Trip *aTrip = [Trip return]
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
