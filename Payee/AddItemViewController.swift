//
//  AddItemViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, BuddyAmountPortionDelegate {
  func didEnterBuddyAmountPortion(buddyAmountPortion: [(name: String, amountPortion: Float)]) {
    print(buddyAmountPortion)
  }
  
  
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var amountTextField: UITextField!
  @IBOutlet weak var payerTextField: UITextField!
  @IBOutlet weak var itemNameTextField: UITextField!
  
  var itemName : String = ""
  var payer : String = ""
  var amount : String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func nextButtonTouched(_ sender: Any) {
    print("next button tapped")
    guard let itemName = itemNameTextField.text, itemName != "" else {
      print("item name is empty")
      return
    }
    self.itemName = itemName
    guard let payer = payerTextField.text, payer != "" else {
      print("payer is empty")
      return
    }
    self.payer = payer
    guard let amount = amountTextField.text, amount != "" else {
      print("amount is empty")
      return
    }
    self.amount = amount
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "itemDetailSegue" {
      if segue.destination is ItemDetailViewController {
        let vc = segue.destination as? ItemDetailViewController
        vc?.payer = self.payer
        vc?.amount = self.amount
        vc?.itemName = self.itemName
        vc?.buddyAmountPortionDelegate = self
      }
    }
  }
}

