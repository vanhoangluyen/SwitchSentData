//
//  TableVC.swift
//  SwitchSentData
//
//  Created by Luyen on 10/24/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit
func showAlert(vc: UIViewController, title:String, message: String) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in}
    
    alertController.addAction(okAction)
    
    vc.present(alertController, animated: true, completion: nil)
}
class TableVC: UITableViewController {
   @IBOutlet var addString: UIBarButtonItem!
    @IBOutlet var addNumber: UIBarButtonItem!
    @IBOutlet weak var switchState: UISwitch!
 
    
    let getDataSourceStr = DataSourceString()
    let getDataSourceNum = DataSourceNumber()
    let getDelegate = SplitDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataSourceStr.DataStr = self
        getDataSourceNum.DataNum = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = getDelegate
        tableView.dataSource = getDataSourceNum
        navigationItem.rightBarButtonItem = addNumber
      
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ClickOn(_ sender: UISwitch) {
        if switchState.isOn {
            tableView.dataSource = getDataSourceNum
         navigationItem.rightBarButtonItem = addNumber
        } else {
            tableView.dataSource = getDataSourceStr
            navigationItem.rightBarButtonItem = addString
        }
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "number":
            let numberSend = getDataSourceNum.arrayNumber[(tableView.indexPathForSelectedRow?.row)!]
            (segue.destination as! NumberVC).getNumber = numberSend
        case "string":
            let stringSend = getDataSourceStr.arrayString[(tableView.indexPathForSelectedRow?.row)!]
            (segue.destination as! StringVC).getString = stringSend
        default:
            print("No Choose")
        }
    }
    @IBAction func unwindNum(sender: UIStoryboardSegue) {
        if let unwinNum = (sender.source as? NumberVC)?.getNumber {
            if let selectedIndexPathNum = tableView.indexPathForSelectedRow {
        // Update existing number
        getDataSourceNum.arrayNumber[selectedIndexPathNum.row] = unwinNum
        tableView.reloadRows(at: [selectedIndexPathNum], with: .none)
            } else {
                //add new row number
                let newIndexPathNum = IndexPath(row: getDataSourceNum.arrayNumber.count, section: 0)
                getDataSourceNum.arrayNumber.append(unwinNum)
                tableView.insertRows(at: [newIndexPathNum], with: .automatic)
            }
        }
        tableView.reloadData()
    }
    @IBAction func unwindString(sender: UIStoryboardSegue) {
        if let unwinStr = (sender.source as? StringVC)?.getString {
            if let selectedIndexPathStr = tableView.indexPathForSelectedRow {
                //update existing string
                getDataSourceStr.arrayString[selectedIndexPathStr.row] = unwinStr
                tableView.reloadRows(at: [selectedIndexPathStr], with: .none)
            } else {
                //add new row string
                let newIndexPathStr = IndexPath(row: getDataSourceStr.arrayString.count, section: 0)
                getDataSourceStr.arrayString.append(unwinStr)
                tableView.insertRows(at: [newIndexPathStr], with: .automatic)
            }
        }
        tableView.reloadData()
    }
}
