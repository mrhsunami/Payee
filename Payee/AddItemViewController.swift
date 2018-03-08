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
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func nextButtonTouched(_ sender: Any) {
    print("next button tapped")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

