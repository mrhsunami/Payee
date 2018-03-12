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
    let activeTrip: Trip = Trip.lastAccessedTripOrInitNewInDatabase()
   var myCurrency: String = "CAD"
  var localCurrency: String = "USD"
    
    func createTransactionRecord(arrayOfbuddyNamesAndPortions: [(String,Float)], transactionName: String, payerName: String, expenseAmount: Float) -> Void {
        
        let meal: Meal = Meal.init(name: transactionName, andExpense: expenseAmount)
        let payer: Buddy = Buddy.newOr(matchingNameString: payerName)
      let convertedExpense = CurrencyManager.convert(expenseAmount, from: localCurrency, to: myCurrency)
        let _: LedgerLine = LedgerLine.init(trip: activeTrip, meal: meal, buddy: payer, tab: 0.00, andPay: convertedExpense)
        for buddyNameAndPortion in arrayOfbuddyNamesAndPortions
        {
            let buddyName = buddyNameAndPortion.0
            let buddy: Buddy = Buddy.newOr(matchingNameString: buddyName)
            let pay: Float = 0.00;
          let convertedTab = CurrencyManager.convert(buddyNameAndPortion.1, from: localCurrency, to: myCurrency)
            let _: LedgerLine = LedgerLine.init(trip: activeTrip, meal: meal, buddy: buddy, tab: convertedTab, andPay: pay)
        }
    }
}
