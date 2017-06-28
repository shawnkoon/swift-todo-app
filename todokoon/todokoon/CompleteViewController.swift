//
//  CompleteViewController.swift
//  todokoon
//
//  Created by Shawn Son on 6/27/17.
//  Copyright © 2017 shawnkoon. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var task = Task()

    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = task.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func completeTapped(_ sender: Any) {
        
    }
}
