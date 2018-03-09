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
}

