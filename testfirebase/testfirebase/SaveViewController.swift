//
//  SaveViewController.swift
//  testfirebase
//
//  Created by Hidran Arias on 04/11/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import UIKit
import Firebase
class SaveViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var quantity: UITextField!
   let todoListRef:DatabaseReference = Database.database().reference().child("todolist")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        guard  let item = name.text, let q = quantity.text else {
            return
        }
        let itemRef = todoListRef.child(item)
        let values: [String: Any] = ["completed" : false, "name":item, "quantity":q]
        itemRef.setValue(values)
        dismiss(animated: true, completion: nil)
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
