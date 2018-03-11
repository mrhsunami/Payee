//
//  TripManager.swift
//  Payee
//
//  Created by Nathan Hsu on 2018-03-07.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

import Foundation

class TripManager: CanCreateTransactionDelegate {
  
  static let shared = TripManager()
  //
  //    var allBuddies: [Buddy] = []
  //
  //    var allTransactions: [TransactionRecord] = []
  
  let activeTrip: Trip = Trip.lastAccessedTripOrInitNewInDatabase()
  
  func createTransactionRecord(arrayOfbuddyNamesAndPortions: [(String,Float)], transactionName: String, payerName: String, expenseAmount: Float) -> Void {

    // Note, if the payer is not listed among the payees, his payment will currently not be recorded.
    let meal: Meal = Meal.init(name: transactionName, andExpense: expenseAmount)
    let payer: Buddy = Buddy.newOr(matchingNameString: payerName)
    for buddyNameAndPortion in arrayOfbuddyNamesAndPortions
    {
      let buddyName = buddyNameAndPortion.0
      let buddy: Buddy = Buddy.newOr(matchingNameString: buddyName)
      var pay: Float = 0.00;
      if(payer.isEqual(to: buddy))
      {
        pay = expenseAmount
      }
      let _: LedgerLine = LedgerLine.init(trip: activeTrip, meal: meal, buddy: buddy, tab: buddyNameAndPortion.1, andPay: pay)
    }
  }
}

