//: Playground - noun: a place where people can play

import Cocoa

class Person {
  var age : Int = 0
  let name : String //let means that once set, it can't change (Kind of like a const)
  var address : String? //The ? means that you can provide an address, but don't have to...
  
  //Designated Initializer
  init(personName : String){
    self.name = personName
  }
}

let me : Person = Person(personName : "Tyler")
me.address = "US"

me.address
me.name
me.age


//Employee is a subclass of Person
class Employee : Person {
  let id : Int
  
  init(personName: String, ident: Int) {
    //The self. is optional here
    self.id = ident
    
    //Known as delegating upwards
    super.init(personName: personName)
    
  }
  
  
  //Convenience Initializer
  //Needs override because this matches an initializer in the parent class
  convenience override init(personName: String) {
    self.init(personName: personName, ident: 0)
  }
  
}

let dev1 = Employee(personName: "Joe", ident: 123)

dev1.name
dev1.id

let intern = Employee(personName: "Jim")

intern.name
intern.id


