//
//  ViewController.swift
//  Todoey
//
//  Created by Alexandre Oliveira on 13/09/18.
//  Copyright © 2018 Alexandre Oliveira. All rights reserved.
//

import UIKit

// 1 - Change the Class name ViewController for UITableViewController
class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike" , "Buy Egoos" , "Destory Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
// 2 - Created TableView Datasource Methods (1 - numberOfRowInSection , 2 - cellForRowAt , 3 - dequeueReusableCell)

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // This variable storage the name of identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // I will get all the itens from Array to within each cell
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
// 3 - TableView Delegate Methods (1 - didSelectRowAt , 2 - )
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
    
        // Inserting Check Mark on the cell and Removing if the user want it.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // Animation for deselect an item after of click
    tableView.deselectRow(at: indexPath, animated: true)
    
    }
   
// 4 - Button - Add Button Pressed
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        // This is a Alert when the user to click on button +
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        // Show up a button to user to click and add new item
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
        // Add new element inside of Array.
            self.itemArray.append(textField.text!)
            
        // After insert some item it is necessary for reload the datas
            self.tableView.reloadData()
            
        }
        
        // It insert a Text Field within of the box of Alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new item"
            textField = alertTextField
            
            print(textField.text)
        }
        
        // Execute the Alert above.
        alert.addAction(action)
        present(alert, animated: true , completion: nil)
    }
    
    
}

