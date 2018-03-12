//
//  SettingsViewController.swift
//  Payee
//
//  Created by Nathan Hsu on 2018-03-11.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var currentHomeCurrency: UILabel!
    
    @IBAction func clearDataButton(_ sender: Any) {
        LedgerLine.clearLedger()
    }
    @IBAction func changeHomeCurrency(_ sender: Any) {
        
    }
    @IBAction func unwindToSettings(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "currencyListHome" {
            if segue.destination is CurrencyTableViewController {
                let vc = segue.destination as? CurrencyTableViewController
                vc?.seguedFrom = "settingsView"
            }
        }
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
        currentHomeCurrency.text = TripManager.shared.myCurrency
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        currentHomeCurrency.text = TripManager.shared.myCurrency
    }


}
