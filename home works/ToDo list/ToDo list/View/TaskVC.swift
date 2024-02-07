//
//  TaskVC.swift
//  ToDo list
//
//  Created by Игорь Крысин on 04.01.2024.
//

import UIKit

class TaskVC: UIViewController {
    
    weak var saveTaskDelegate: SaveUserTaskDelegate?
   
    //weak var taskIsDoneDelegate: 

    @IBOutlet weak var userTaskField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func saveTaskPressed(_ sender: Any) {
        if let task = userTaskField.text {
            if !task.isEmpty {
                let task = TaskModel(taskName: task, taskCellColor: .white)
                saveTaskDelegate?.saveTask(task: task)
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
