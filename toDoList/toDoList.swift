//
//  toDoList.swift
//  toDoList
//
//  Created by Student on 5/4/17.
//  Copyright © 2017 SHP. All rights reserved.
//


import UIKit

class ToDoList: NSObject {
    
    private let fileURL: URL = {
        
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectoryURL = documentDirectoryURLs.first!
        
        return documentDirectoryURL.appendingPathComponent ("toDoLists.items")
        
    } ()
    
    fileprivate var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    // saving the items in the Table View
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("Saving Items to \(fileURL)")
        
        if !itemsArray.write(to: fileURL, atomically: true) {
            print("Could not Save To-Do-List")
        
        }
        
    }
    
    
    //Loading items into the table view
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL) as? (String) {
            items = [itemsArray]
        }
    }

 //adding an item to the array
    
    func add(_ item: String) {
        items.append(item)
        saveItems()
    }


//removing an item
    
    func removeItem(Index: Int) {
        items.remove(at: Index)
        saveItems()
    }

}

//UITableView with cells and rows


extension ToDoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    
    }
}

