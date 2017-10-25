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
    
    var arrayNumber = [Int](1...10)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNumber.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usenumber", for: indexPath)
        cell.textLabel?.text = "\(arrayNumber[indexPath.row])"
        return cell
    }
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}
