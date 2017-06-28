//
//  TasksViewController.swift
//  todokoon
//
//  Created by Shawn Son on 5/27/17.
//  Copyright © 2017 shawnkoon. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTodoSegue", sender: selectedTask)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "‼️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Code program"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Cut the cheese and I like to cut the cheese isn't that nice?"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Wash my car"
        task3.important = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "newTodoSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newTodoSegue" {
            let nextViewController = segue.destination as! CreateTaskViewController
            nextViewController.previousViewController = self
        } else if segue.identifier == "selectTodoSegue" {
            let nextViewController = segue.destination as! CompleteViewController
            nextViewController.task = sender as! Task
        }
    }
}

