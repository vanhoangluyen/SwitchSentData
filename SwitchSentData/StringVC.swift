//
//  ViewController.swift
//  SwitchSentData
//
//  Created by Luyen on 10/24/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class StringVC: UIViewController {
    @IBOutlet weak var editStringTextField: UITextField!
    
    var getString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if getString != nil {
            editStringTextField.text = getString
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        getString = editStringTextField.text
    }

}

