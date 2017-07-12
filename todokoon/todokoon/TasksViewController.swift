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
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
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
            cell.textLabel?.text = "‼️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "newTodoSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("Error!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTodoSegue" {
            let nextViewController = segue.destination as! CompleteViewController
            nextViewController.task = sender as? Task
        }
    }
}

