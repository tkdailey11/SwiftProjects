//
//  ViewController.swift
//  BMI
//
//  Created by Tyler Dailey on 12/20/16.
//  Copyright © 2016 Tyler Dailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  //Weight and height are called "Stored Properties"
  var weight : Double?
  var height : Double?
  
  //bmi is a computed property
  var bmi : Double? {
    get {
      if (weight != nil) && (height != nil) {
        return (weight! / (height! * height!)) * 703
      }
      else {
        return nil
      }
    }
  }
  
  
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
    updateUI()
    return true
  }
  
  func updateUI() {
    if let b = self.bmi {
      self.bmiLabel.text = String(format: "%4.1f", b)
    }
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    guard let txt : String = textField.text else {
      return
    }
    
    
    //-> Double means "Returns a Double"
    func convert(numString : String) -> Double? {
      let result : Double? = NumberFormatter().number(from: numString)?.doubleValue
      return result
    }
    
    switch (textField) {
      
    case heightTextField:
      self.height = convert(numString: txt)
      
    case weightTextField:
      self.weight = convert(numString: txt)
      
    default:
      print("ERROR")
      
    } //end of switch
    
    updateUI()
    
  }

}

