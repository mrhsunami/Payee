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
    
    var allBuddies: [Buddy] = []

    var allTransactions: [TransactionRecord] = []

    func createTransactionRecord(arrayOfbuddyNamesAndPortions: [(String,Float)], transactionName: String, payerName: String, expenseAmount: Float) -> Void {

        // Here is an empty array outside the scope of the for loop below that makes multiple BuddyTransactionEvent objects.
        var buddyTransactionEvents: [BuddyTransactionEvent] = []

        // Create Buddy objects if they don't already exist in allBuddies array
        for buddyNameAndPortion in arrayOfbuddyNamesAndPortions {

            let buddyName = buddyNameAndPortion.0
            let buddyPortion = buddyNameAndPortion.1
            var buddyPaidAmount: Float = 0

            if payerName == buddyName {
                buddyPaidAmount = expenseAmount
            }

            // Check if buddyName exists in allBuddies array.
            var existingBuddyNames: [String] = []
            for buddy in allBuddies {
                existingBuddyNames.append(buddy.buddyName)
            }

            // Check if existingBuddyNames array contains buddyName. If so, that buddy already exist. If not create new Buddy and add it to allBuddies array.
            if !existingBuddyNames.contains(buddyName), let aBuddy = Buddy(buddyName: buddyName) {
                allBuddies.append(aBuddy)
            }

            // Create a BuddyTransactionEvent Object. Pass in a Buddy from allBuddies where its name matches buddyName
            if let currentBuddy = allBuddies.first(where: {$0.buddyName == buddyName}) {
                if let aBuddyTransactionEvent = BuddyTransactionEvent(buddy: currentBuddy, tabAmountCAD: buddyPortion, andPaidAmountCAD: buddyPaidAmount) {
                    buddyTransactionEvents.append(aBuddyTransactionEvent)
                }
            }
        }
        // Create a TransactionRecord and place it into the TransactionRecord array that TripManager holds
        let currentDate = Date()
        if let transactionRecord = TransactionRecord(name: transactionName, date: currentDate, andBuddyTransactionEvents: buddyTransactionEvents) {
            allTransactions.append(transactionRecord)
        } else {
            print("could not add transaction") // later we can make this an alert
        }
        print(allTransactions.count)
//        if let summedTransactionRecord = TransactionRecord.sumTransactions(from: allTransactions) {
//
//        }
        
    }

}
