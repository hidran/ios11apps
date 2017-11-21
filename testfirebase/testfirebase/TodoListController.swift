//
//  TodoListController.swift
//  testfirebase
//
//  Created by Hidran Arias on 12/10/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import UIKit
import Firebase
class TodoListController: UITableViewController {
    var todoItems:[TodoItem] = []
let todolistRef: DatabaseReference = Database.database().reference().child("todolist")
    
    override func viewDidLoad() {
         super.viewDidLoad()
        var todoItems:[TodoItem] = []
        todolistRef.observe(.value) { (snapShot, nil) in
             todoItems = []
            for item in snapShot.children  {
              
              let todoData = item as! DataSnapshot
                let todo = todoData.value as!  [String:Any]

                let p = TodoItem(name: todo["name"] as! String, completed:todo["completed"] as! Bool, quantity: String(describing: todo["quantity"]!)
                )
                todoItems.append(p)
                print(p.name)
               
               
            }
            self.todoItems = todoItems
            self.tableView.reloadData()
             print(self.todoItems.count)
        }
       
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("rows in sectiontoto\(self.todoItems.count)")
        return todoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let p = todoItems[indexPath.row]
        cell.textLabel?.text = p.name
        cell.accessoryType = p.completed ? .checkmark : .none
        cell.detailTextLabel?.text = p.quantity
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let p = todoItems[indexPath.row]
        p.completed = !p.completed
        todolistRef.child(p.name).updateChildValues(["completed": p.completed])
         cell?.accessoryType = p.completed ? .checkmark : .none
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let p = todoItems[indexPath.row]
            // Delete the row from the data source
            todoItems.remove(at: indexPath.row)
           
            todolistRef.child(p.name).setValue(nil)
           
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
