//
//  TableVC.swift
//  SwitchSentData
//
//  Created by Luyen on 10/24/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {
    @IBOutlet weak var switchState: UISwitch!
    
    let getDataSourceStr = DataSourceString()
    let getDataSourceNum = DataSourceNumber()
    let getDelegate = SplitDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = getDelegate
        tableView.dataSource = getDataSourceNum
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ClickOn(_ sender: UISwitch) {
        if switchState.isOn {
            tableView.dataSource = getDataSourceNum
        } else {
            tableView.dataSource = getDataSourceStr
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
        let unwinNum = (sender.source as? NumberVC)?.getNumber
        getDataSourceNum.arrayNumber[(tableView.indexPathForSelectedRow?.row)!] = unwinNum!
        tableView.reloadData()
        
    }
    @IBAction func unwindString(sender: UIStoryboardSegue) {
        let unwinStr = (sender.source as? StringVC)?.getString
        getDataSourceStr.arrayString[(tableView.indexPathForSelectedRow?.row)!] = unwinStr!
        tableView.reloadData()
    }
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
