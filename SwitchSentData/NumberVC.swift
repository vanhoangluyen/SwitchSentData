//
//  NumberVC.swift
//  SwitchSentData
//
//  Created by Luyen on 10/24/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class NumberVC: UIViewController {
    @IBOutlet weak var editNumberTextField: UITextField!
    
    var getNumber: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        if getNumber != nil {
            editNumberTextField.text = "\(getNumber!)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let editNumber = Int(editNumberTextField?.text ?? "") else {
            return
        }
        getNumber = editNumber
        
    }
}
