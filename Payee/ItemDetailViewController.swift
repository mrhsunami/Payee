//
//  ItemDetailViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

protocol CanCreateTransactionDelegate {
    
    func createTransactionRecord(arrayOfbuddyNamesAndPortions: [(String,Float)], transactionName: String, payerName: String, expenseAmount: Float) -> ()
}

class ItemDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var payerLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var buddy1NameTextField: UITextField!
    @IBOutlet weak var buddy1AmountPortionTextField: UITextField!
    @IBOutlet weak var buddy2NameTextField: UITextField!
    @IBOutlet weak var buddy2AmountPortionTextField: UITextField!
    @IBOutlet weak var buddy3NameTextField: UITextField!
    @IBOutlet weak var buddy3AmountPortionTextField: UITextField!
    
    //  variables passed from add item screen
    var itemName = ""
    var payer = ""
    var amount = ""
    var dataProcessingDelegate: CanCreateTransactionDelegate? = nil
    
  @objc fileprivate func retractKeyboard() {
    view.endEditing(true)
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    moveTextField(textField: textField, moveDistance: -250, up: true)
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
    moveTextField(textField: textField, moveDistance: -250, up: false)
  }
  
  func moveTextField(textField: UITextField, moveDistance: Int, up: Bool) {
    let moveDuration = 0.3
    let movement = CGFloat(up ? moveDistance : -moveDistance)
    
    UIView.beginAnimations("animateTextField", context: nil)
    UIView.setAnimationBeginsFromCurrentState(true)
    UIView.setAnimationDuration(moveDuration)
    
    self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
    UIView.commitAnimations()
  }

    
    @IBAction func saveButtonTouched(_ sender: Any) {
        print("done button tapped")
        
        //    store each buddy's name and corresponding portion of the amount paid by the payer in a tuple
        let buddyAmountPortionTuple1 = (buddy1NameTextField.text, (buddy1AmountPortionTextField.text! as NSString).floatValue)
        let buddyAmountPortionTuple2 = (buddy2NameTextField.text, (buddy2AmountPortionTextField.text! as NSString).floatValue)
        let buddyAmountPortionTuple3 = (buddy3NameTextField.text, (buddy3AmountPortionTextField.text! as NSString).floatValue)
        
        //    store the tuples in an array
        var buddyAmountPortionArray : [(name: String, amountPortion: Float)] = []
        buddyAmountPortionArray.append(buddyAmountPortionTuple1 as! (name: String, amountPortion: Float))
        buddyAmountPortionArray.append(buddyAmountPortionTuple2 as! (name: String, amountPortion: Float))
        buddyAmountPortionArray.append(buddyAmountPortionTuple3 as! (name: String, amountPortion: Float))
        
        let transactionName = itemName
        let payerName = payer
        let expenseAmount: Float = (amount as NSString).floatValue
        
        dataProcessingDelegate?.createTransactionRecord(arrayOfbuddyNamesAndPortions: buddyAmountPortionArray, transactionName: transactionName, payerName: payerName, expenseAmount: expenseAmount)
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
      let tapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(retractKeyboard))
      self.view.addGestureRecognizer(tapToCloseKeyboard)
      
      buddy1NameTextField.delegate = self
      buddy2NameTextField.delegate = self
      buddy3NameTextField.delegate = self
      buddy1AmountPortionTextField.delegate = self
      buddy2AmountPortionTextField.delegate = self
      buddy3AmountPortionTextField.delegate = self

      //    populate the variables passed from add item screen
=======
        let tapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(retractKeyboard))
        self.view.addGestureRecognizer(tapToCloseKeyboard)
        
        //    populate the variables passed from add item screen
>>>>>>> master
        itemNameLabel.text = itemName
        payerLabel.text = payer
        amountLabel.text = amount
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
