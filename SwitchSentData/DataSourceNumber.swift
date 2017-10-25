//
//  File.swift
//  SwitchSentData
//
//  Created by Luyen on 10/24/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import Foundation
import UIKit

class DataSourceNumber: NSObject, UITableViewDataSource {
    
    var DataNum: TableVC!
    var arrayNumber = Array(0...10)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNumber.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usenumber", for: indexPath)
        cell.textLabel?.text = "\(arrayNumber[indexPath.row])"
        return cell
    }
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayNumber.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if arrayNumber.count == 0 {
                showAlert(vc: DataNum, title: "OK", message: "NO DATA")
            }
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
  
}
