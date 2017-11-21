//
//  ViewController.swift
//  FCM
//
//  Created by Hidran Arias on 24/09/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginAnonym();
    }
    func loginAnonym()
    {
        
        Auth.auth().signInAnonymously(){
            
            (user,error) in
            print(error)
            print(user?.uid)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

