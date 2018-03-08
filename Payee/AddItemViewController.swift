//
//  AddItemViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

//protocol AddItemProtocol {
//  var itemName : String { get set }
//  var payerName : String { get set }
//  var amount : Float { get set }
//}

class AddItemViewController: UIViewController {
  
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var amountTextField: UITextField!
  @IBOutlet weak var payerTextField: UITextField!
  @IBOutlet weak var itemNameTextField: UITextField!
  
  var itemName = ""
  var payer = ""
  var amount = 0.00

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
    guard let payer = payerTextField.text, payer != "" else {
      print("payer is empty")
      return
    }
//    guard let amountString = amountTextField.text, amount = Float(amountString) else {
    guard let amount = amountTextField.text, amount != "" else {
      print("amount is empty")
      return
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is ItemDetailViewController {
      let vc = segue.destination as? ItemDetailViewController
      vc?.payer = self.payer
      vc?.amount = self.amount
      vc?.itemName = self.itemName
    }
  }
}

