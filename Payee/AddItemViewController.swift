//
//  AddItemViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var payerTextField: UITextField!
    @IBOutlet weak var itemNameTextField: UITextField!
    
    let tripManager = TripManager()
    var itemName : String = ""
    var payer : String = ""
    var amount : String = ""
    
    @objc fileprivate func retractKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField: textField, moveDistance: -80, up: true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField: textField, moveDistance: -80, up: false)
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(retractKeyboard))
        self.view.addGestureRecognizer(tapToCloseKeyboard)
        amountTextField.delegate = self
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemDetailSegue" {
            if segue.destination is ItemDetailViewController {
                let vc = segue.destination as? ItemDetailViewController
                vc?.payer = self.payer
                vc?.amount = self.amount
                vc?.itemName = self.itemName
                vc?.dataProcessingDelegate = self.tripManager
            }
        }
    }
    
}
