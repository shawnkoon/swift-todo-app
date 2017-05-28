//
//  CreateTaskViewController.swift
//  todokoon
//
//  Created by Shawn Son on 5/28/17.
//  Copyright © 2017 shawnkoon. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var isImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
    }

}
