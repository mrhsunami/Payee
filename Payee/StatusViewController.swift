//
//  StatusViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

var buddiesArray : [String] = ["Chris", "Nathan", "Kevin"]
var netAmountArray : [Float] = [30.00, 60.00, 90.00]

class StatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var statusTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.statusTableView.dataSource = self
    //    self.statusTableView.delegate = self  //in case delegate property is ever needed
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return buddiesArray.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let statusTableViewCell : StatusTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StatusTableViewCell
    statusTableViewCell.buddyNameLabel.text = buddiesArray[indexPath.row]
    statusTableViewCell.netAmountLabel.text = String(netAmountArray[indexPath.row])
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
        vc?.buddyName = buddiesArray[indexPath.row]
        
        //        create separate array with other buddies that were not selected
        //        by removing selected buddy from it
        var otherBuddiesArray = buddiesArray
        otherBuddiesArray.remove(at: indexPath.row)
        vc?.otherBuddiesArray = otherBuddiesArray
        
        vc?.buddyNetAmount = String(netAmountArray[indexPath.row])  //selected buddy net amount
      }
    }
  }
}

