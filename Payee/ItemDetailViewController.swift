//
//  ItemDetailViewController.swift
//  MidTerm
//
//  Created by KevinT on 2018-03-07.
//  Copyright © 2018 KevinT. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var doneButton: UIButton!
  @IBOutlet weak var amountTextField: UILabel!
  @IBOutlet weak var payerTextField: UILabel!
  @IBOutlet weak var itemNameTextField: UILabel!
  
  @IBAction func doneButtonTouched(_ sender: Any) {
    print("done button tapped")
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
//    doneButton.isEnabled = false
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
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
