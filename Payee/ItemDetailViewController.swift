//
//  ItemDetailViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

protocol BuddyAmountPortionDelegate {
  func didEnterBuddyAmountPortion(buddyAmountPortion : [(name: String, amountPortion: String)]) -> ()
}

class ItemDetailViewController: UIViewController, BuddyAmountPortionDelegate {
  
  func didEnterBuddyAmountPortion(buddyAmountPortion: [(name: String, amountPortion: String)]) {
    print("passing data back")
  }

  @IBOutlet weak var doneButton: UIButton!
  @IBOutlet weak var itemNameLabel: UILabel!
  @IBOutlet weak var payerLabel: UILabel!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var buddy1NameTextField: UITextField!
  @IBOutlet weak var buddy1AmountPortionTextField: UITextField!
  @IBOutlet weak var buddy2NameTextField: UITextField!
  @IBOutlet weak var buddy2AmountPortionTextField: UITextField!
  @IBOutlet weak var buddy3NameTextField: UITextField!
  @IBOutlet weak var buddy3AmountPortionTextField: UITextField!
  
  var itemName = ""
  var payer = ""
  var amount = ""
  var buddyAmountPortionDelegate : BuddyAmountPortionDelegate? = nil
  
//  init() {
//    buddyAmountPortionDelegate = UIApplication.shared.delegate as! BuddyAmountPortionDelegate
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
  
  @IBAction func doneButtonTouched(_ sender: Any) {
    print("done button tapped")
    let buddyAmountPortionTuple1 = (buddy1NameTextField.text, buddy1AmountPortionTextField.text)
    let buddyAmountPortionTuple2 = (buddy2NameTextField.text, buddy2AmountPortionTextField.text)
    let buddyAmountPortionTuple3 = (buddy3NameTextField.text, buddy3AmountPortionTextField.text)
    var buddyAmountPortionArray : [(name: String, amountPortion: String)] = []
    buddyAmountPortionArray.append(buddyAmountPortionTuple1 as! (name: String, amountPortion: String))
    buddyAmountPortionArray.append(buddyAmountPortionTuple2 as! (name: String, amountPortion: String))
    buddyAmountPortionArray.append(buddyAmountPortionTuple3 as! (name: String, amountPortion: String))

    buddyAmountPortionDelegate?.didEnterBuddyAmountPortion(buddyAmountPortion: buddyAmountPortionArray)
    navigationController?.popViewController(animated: true)
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
//    doneButton.isEnabled = false
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    itemNameLabel?.text = itemName
    payerLabel?.text = payer
    amountLabel?.text = amount
//    self.buddyAmountPortionDelegate = self
//    buddyAmountPortionDelegate = UIApplication.shared.delegate as? BuddyAmountPortionDelegate
//    doneButton.isEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
