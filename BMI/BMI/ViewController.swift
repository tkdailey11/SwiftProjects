//
//  ViewController.swift
//  BMI
//
//  Created by Tyler Dailey on 12/20/16.
//  Copyright © 2016 Tyler Dailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
  
  class func doDiv2(u: Int) -> Double {
    return Double(u) * 0.5
  }
  
  
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
  
  let listOfHeights = Array(100...200).map(ViewController.doDiv2)
  let listOfWeights : Array<Double> = Array(200...500).map(ViewController.doDiv2)
  
  @IBOutlet weak var weightPickerView: UIPickerView!
  @IBOutlet weak var heightPickerView: UIPickerView!
  @IBOutlet weak var bmiLabel: UILabel!
  @IBOutlet weak var heightTextField: UITextField!
  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var bmiLabeliPad: UILabel!
  
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
      self.bmiLabeliPad.text = String(format: "%4.1f", b)
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
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch(pickerView){
    case heightPickerView:
      return self.listOfHeights.count
    case weightPickerView:
      return self.listOfWeights.count
    default:
      return 1
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    switch(pickerView){
    case heightPickerView:
      return String(format: "%4.1f", self.listOfHeights[row])
    case weightPickerView:
      return String(format: "%4.1f", self.listOfWeights[row])
    default:
      return ""
    }
    
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    switch(pickerView){
      
      case heightPickerView:
        self.height = self.listOfHeights[row]
      
      case weightPickerView:
        self.weight = self.listOfWeights[row]
      
      default:
        break
    }
    
    updateUI()

  }

}

