//
//  CompleteViewController.swift
//  todokoon
//
//  Created by Shawn Son on 6/27/17.
//  Copyright © 2017 shawnkoon. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var task: Task? = nil

    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = task!.name!
        
        if task!.important {
            nameLabel.text = "‼️\(task!.name!)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
}
