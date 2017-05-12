
//  ViewController.swift
//  toDoList
//
//  Created by Student on 5/2/17.
//  Copyright © 2017 SHP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Label for the To-Do-List
    
    @IBOutlet var toDoListLabel: UILabel!
    
    // TextField
    
    @IBOutlet var textField: UITextField!
    
    // Table View
    
    @IBOutlet var tableView: UITableView!
    
    // Button to connect to the TableView adn adding the text to the Table View 
    
    @IBAction func submitButton(_ sender: AnyObject) {
        
        guard let text = textField.text, text != "" else {
            return
        }
        
        let list = ToDoList()
        list.add(text)
        textField.text = ""
        tableView.reloadData()
    }
    
    //removing the item in the Table View
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let list = ToDoList()
        list.removeItem(Index: indexPath.row)
        tableView.reloadData()
        return indexPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

