//
//  TodoItem.swift
//  testfirebase
//
//  Created by Hidran Arias on 12/10/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import Foundation
import Firebase
class TodoItem {
    var name:String
    var completed : Bool
    var quantity : String
    init(name:String, completed:Bool, quantity:String) {
        self.name = name
        self.completed = completed
        self.quantity = quantity
    }
    init(todoItem todoData:DataSnapshot){
        let todoItem = todoData.value as! [String:Any]
        
         name = String(describing: todoItem["name"]!)
        
         completed = todoItem["completed"] as! Bool
        
         quantity = String(describing:todoItem["quantity"]!)
    }
}
