//
//  ViewController.swift
//  testfirebase
//
//  Created by Hidran Arias on 24/09/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import UIKit
import Firebase
import WebKit
class ViewController: UIViewController {
  
    let todolistRef: DatabaseReference = Database.database().reference().child("todolist")
    let userRef: DatabaseReference = Database.database().reference().child("users")
    override func viewDidLoad() {
        super.viewDidLoad()
      //  loginAnonym()
       var item = todolistRef.child("zucchero")
        var values: [String: Any] = ["completed" : true, "name":"zucchero", "quantity":"2kg"]
        item.setValue(values)
        item = todolistRef.child("sapone")
        values = ["completed" : true, "name":"sapone", "quantity":1]
        item.setValue(values)
        
        item = userRef.childByAutoId()
        values = ["name":"Hidran", "lastname":"Arias", "email":"test@hidran.com", "age": 45]
        item.setValue(values)
       
    }
    func loginAnonym(){
        Auth.auth().signInAnonymously { (User, Error) in
            if let error = Error {
                print(error)
            } else {
                if let user = User {
                    print(user.uid)
                }
            }
        }
    }
   


}

