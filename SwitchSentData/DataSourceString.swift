//
//  DataSourceString.swift
//  SwitchSentData
//
//  Created by Luyen on 10/24/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import Foundation
import UIKit

class DataSourceString: NSObject ,UITableViewDataSource {
    
    var arrayString = ["Nhất", "Nhị", "Tam", "Tứ", "Ngũ", "Lục", "lục", "Thất", "Bát", "Cửu", "Thập"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayString.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usestring", for: indexPath)
        cell.textLabel?.text = arrayString[indexPath.row]
        return cell
    }
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}
