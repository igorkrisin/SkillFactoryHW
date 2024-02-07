//
//  TaskCell.swift
//  ToDo list
//
//  Created by Игорь Крысин on 04.01.2024.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var task: TaskModel?
    
    weak var deleteTaskDelegate: DeleteUserTaskDelegate?
    weak var completedTaskDelegate: CompletedUserTaskDelegate?

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var someTask: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }


    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        guard let task = task else { return }
            print("task: ", task)
            deleteTaskDelegate?.deleteTask(task: task)
        
    }
    
    
    @IBAction func executeTaskBtnPressed(_ sender: Any) {
        guard let task = self.task else { return }
        completedTaskDelegate?.changeColorCell(task: task)
        
    }
    
    func cellData(task: TaskModel) {
        someTask.text = task.taskName
        viewCell.backgroundColor = task.taskCellColor
        self.task = task
    }
    
    
}
