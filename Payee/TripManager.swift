//
//  TripManager.swift
//  Payee
//
//  Created by Nathan Hsu on 2018-03-07.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

import Foundation

class TripManager {

    var allBuddies: [Buddy] = []

    var allTransactions: [TransactionRecord] = []

    func createTransactionRecord(arrayOfbuddyNamesAndPortions: [(String,Float)], transactionName: String, payerName: String, expenseAmount: Float) -> Void {

        // Here is an empty array outside the scope of the for loop that makes multiple BuddyTransactionEvent objects.
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
    }


    // func calculateSummaryFromTransactions {...
    /*
    1. Create empty array of MemberRecords
    2. Take in an array of transactions. For each transaction, it will return all the MemberRecord objects
    3. Now we have array of all MemberRecords from all transactions.

     1. First create an empty Dictionary outside that looks like this (Buddy:(Tabs: Float?,Pays: Float?))
     2. Iterate through MemberRecord array and check if Buddy propery matches Dictionary key. If it doesnt exist, Dictionary[Buddy] = (0.0, 0.0). If it does exit, return and do the next one
     3. Now we should have a dictionary with all the Buddies that are found in these MemberRecords. All their .tabs, and .pays are 0.
     4. Iterate through the MemberRecord array for each Dictionary key. Update the tuple ".tab" and ".pays" variables by adding the new value to the old value.
     5. At the end of this, we should have a Dectionary with keys for all the Buddy objects. And each Buddy object has a tuple where the .tab is the full amount of debts, and the .pays is the full amount of expenses.
     6. Create a cell with the name as the dictionary key, and a label that shows the difference between the .tab totals and .pay totals.
     7. Return the cell to the TableViewController.
    */

}
