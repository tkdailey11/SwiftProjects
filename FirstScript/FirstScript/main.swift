//
//  main.swift
//  FirstScript
//
//  Created by Tyler Dailey on 12/20/16.
//  Copyright © 2016 Tyler Dailey. All rights reserved.
//
!/usr/bin/swift

import Foundation
class MythicalBeast {
  func whatsMyName() {
    print("I don't know what I am, but I'm the stuff of legends.")
  }
}

class Kraken: MythicalBeast {
  override func whatsMyName() {
    print("I'm the Kraken, yo!")
  }
}

//can't use the Kraken class until after the declaration
let kraken = Kraken() kraken.whatsMyName()
