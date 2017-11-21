//
//  FbTodoListController.swift
//  testfirebase
//
//  Created by Hidran Arias on 15/10/17.
//  Copyright © 2017 Hidran Arias. All rights reserved.
//

import UIKit
import Firebase

class CompletedTodoListController: UITableViewController {
    
    var todoListItems:[TodoItem] = []
    
    let todoListRef:DatabaseReference = Database.database().reference().child("todolist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoListRef.queryOrdered(byChild: "completed") .queryEqual(toValue: true).observe(.value) { (snapshot) in
             self.todoListItems = []
            for item in snapshot.children {
                let todoData = item as! DataSnapshot
                
                let todo = TodoItem(todoItem: todoData)
                self.todoListItems.append(todo)
            }
            self.tableView.reloadData()
            
        }
        
      
       
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
        return todoListItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedTodoListCell", for: indexPath)
         let todo = todoListItems[indexPath.row]
        cell.textLabel?.text = todo.name
        cell.detailTextLabel?.text = todo.quantity
        cell.accessoryType = todo.completed ? .checkmark : .none
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let p = todoListItems[indexPath.row]
            p.completed = !p.completed
         let cell = tableView.cellForRow(at: indexPath)
         cell?.accessoryType = p.completed ? .checkmark : .none
          todoListRef.child(p.name).updateChildValues(["completed" : p.completed])
    
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let p = todoListItems[indexPath.row]
            todoListRef.child(p.name).removeValue()
            todoListItems.remove(at: indexPath.row)
            //tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
