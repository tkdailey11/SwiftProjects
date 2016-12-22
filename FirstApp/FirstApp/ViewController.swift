//
//  ViewController.swift
//  FirstApp
//
//  Created by Tyler Dailey on 12/19/16.
//  Copyright © 2016 Tyler Dailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var messageLabel: UILabel!
  
  let messageArray = ["May the force be with you", "Live long and prosper", "To infinity and beyond", "Other really really really long random string to test things going off the screen"]
  
  var index : Int = 0
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func doButtonTap(_ sender: Any) {
    print("Button touched!")
    
    let nextString = self.messageArray[index]
    
    self.messageLabel.text = nextString
    
    index+=1
    
    index %= self.messageArray.count
  }
}

