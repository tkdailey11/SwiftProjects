//
//  ViewController.swift
//  BMI
//
//  Created by Tyler Dailey on 12/20/16.
//  Copyright © 2016 Tyler Dailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  var weight : Double
  var height : Double
  
  
  @IBOutlet weak var bmiLabel: UILabel!
  @IBOutlet weak var heightTextField: UITextField!
  @IBOutlet weak var weightTextField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    
    
    
    return true
  }

}

