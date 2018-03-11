//
//  StatusViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

//var buddiesArray : [String] = []
//var netAmountArray : [Float] = [30.00, 60.00, 90.00]
var infoForRows: [NSArray] = []


class StatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var statusTableView: UITableView!
    
    func loadDataForView() {
        infoForRows = []
        if let buddySummaryArray = LedgerLine.settleUpSummary(for: TripManager.shared.activeTrip) {
            for eachObject in buddySummaryArray {
                let ledgerline = eachObject as! NSArray
                
                let name = ledgerline[0] as! String
                let tab = Float(truncating: ledgerline[1] as! NSNumber)
                let pays = Float(truncating: ledgerline[2] as! NSNumber)
                let totals = Float(truncating: ledgerline[3] as! NSNumber)
                
                let rowInfo: NSArray = [name, tab, pays, totals]
                infoForRows.append(rowInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusTableView.dataSource = self
        loadDataForView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDataForView()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoForRows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statusTableViewCell : StatusTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StatusTableViewCell
        //    statusTableViewCell.buddyNameLabel.text = buddiesArray[indexPath.row]
        //    statusTableViewCell.netAmountLabel.text = "$" +  String(netAmountArray[indexPath.row])
        statusTableViewCell.buddyNameLabel.text = infoForRows[indexPath.row][0] as? String
        statusTableViewCell.netAmountLabel.text = infoForRows[indexPath.row][3] as? String
        return statusTableViewCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //    segue to summary detail screen when clicking on each buddy
        if segue.identifier == "statusDetailSegue" {
            if segue.destination is StatusDetailViewController {
                let vc = segue.destination as? StatusDetailViewController
                
                //        reference to selected buddy
                var indexPath : IndexPath = self.statusTableView.indexPathForSelectedRow!
                
                //        buddy name from selected buddy
                vc?.buddyName = infoForRows[indexPath.row][0] as! String
                
                //        create separate array with other buddies that were not selected
                //        by removing selected buddy from it
                var otherBuddiesArray = Array(infoForRows)
                otherBuddiesArray.remove(at: indexPath.row)
                
                let otherBuddieString = infoForRows.map { $0[0] } as! [String]
                vc?.otherBuddiesArray = otherBuddieString
                
                vc?.buddyNetAmount = String(describing: infoForRows[indexPath.row][3])  //selected buddy net amount
            }
        }
    }
}

