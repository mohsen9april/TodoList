//
//  ViewController.swift
//  TodoList
//
//  Created by Mohsen Abdollahi on 3/15/19.
//  Copyright © 2019 Mohsen Abdollahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
     var names = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addName(_ sender: Any) {
        // Create AlertView
        let alert = UIAlertController(title: "New Name",message: "Add a new name",preferredStyle: .alert)
        
        // Create Save Button in AlertView
        let saveAction = UIAlertAction(title: "Save",style: .default,handler: { (action:UIAlertAction) -> Void in
            let textField = alert.textFields!.first
            self.names.append(textField!.text!)
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",style: .default) { (action: UIAlertAction) -> Void in
        }
        
        
        alert.addTextField {(textField: UITextField) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert,animated: true,completion: nil)
        
}


func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
    return names.count
}
func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
    cell!.textLabel!.text = names[indexPath.row]
    return cell!
}
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            names.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    
    
    

    }


