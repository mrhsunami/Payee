//
//  TripManager.swift
//  Payee
//
//  Created by Nathan Hsu on 2018-03-07.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

import Foundation

class TripManager {
    
    // var array of Buddy
    var allBuddies: [Buddy] = []
    
    // var array of Transactions.
    var allTransactions: [TransactionRecord] = []
    
    
    // func touchUpInsideFromDoneButtonPressed {...
    func callMeFromDoneButton(arrayOfNewBuddyNamesFromTextFieldtext buddyNamesAndPortions: [(String,Float)]) -> Void {
        
        // when the user hits done:
        //  1. Check if the array of names being passed in matches existing names of Buddy objects from the array of Buddy objects that TripManager holds.
        //  2. If it matches, don't create new instances of Buddy. If it does not exist, then new Buddy class instances would need to be created using the names passed in.
        for buddyNameAndPortion in buddyNamesAndPortions {
            
            // check if buddyName exists in allBuddies array.
            // create an array to hold existing buddy names from the allBuddies array that we find.
            var existingBuddyNames: [String] = []
            // iterate through the allBuddies array and grab the name properties ".buddyName"
            for buddy in allBuddies {
                existingBuddyNames.append(buddy.buddyName)
            }
            // check the existingBuddyNames string array contains buddyName. If so, don't create another Buddy. If it does not exist, then initiate a new Buddy and add it to the allBuddies array.
            let buddyName = buddyNameAndPortion.0
            let buddyPortion = buddyNameAndPortion.1
            
            if !existingBuddyNames.contains(buddyName), let aBuddy = Buddy(buddyName: buddyName) {
                    allBuddies.append(aBuddy)
            }
            //  3. Now an array of Buddy objects exist.
            
            //  4. We can create MemberRecord Objects(taking in aBuddy, Buddy's tabAmount, Buddy's paidAmount)
            var AllBuddyTransactionEventsForThisTransaction: [BuddyTransactionEvent] = []
            //
            
            
        }
        
        
        //         For each MemberRecord, put it in an array. And call Transaction Class init method that takes the array of MemberRecords, along with context info (Name, Description, Date etc). It will return itself, an instance of the Transaction Class.
        //
        //         Take that Transaction Object and put it in to the Transactions array.
 
        
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
