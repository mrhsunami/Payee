//
//  SettingsViewController.swift
//  Payee
//
//  Created by Nathan Hsu on 2018-03-11.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    
    @IBAction func clearDataButton(_ sender: Any) {
        LedgerLine.clearLedger()
    }
    
    
    
//    @IBOutlet weak var clearDataButton: UIButton!
//    @IBAction func clearDataButton(_ sender: Any) {
//
//        LedgerLine.clearLedger()
////        clearDataButton.setTitle("Data cleared", for: .normal)
////        clearDataButton.isEnabled = false
//
//
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
