//
//  TaskListTVC.swift
//  ToDo list
//
//  Created by Игорь Крысин on 04.01.2024.
//

import UIKit

class TaskListTVC: UITableViewController {

    var vc = TaskVC() // пригодится для дальнейшей работы с данными класса TaskVC и что бы сказать приложению куда переходить
    
    
    
    var arrayUserTask = [TaskModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserTask.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell()}
        
        arrayUserTask[indexPath.row].currentIndex = indexPath
        let task = arrayUserTask[indexPath.row]
        cell.cellData(task: task)
        cell.deleteTaskDelegate = self
        cell.completedTaskDelegate = self
        return cell
    }

    @IBAction func showTaskVC(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
        present(vc, animated: true, completion: nil)
        vc.saveTaskDelegate = self
        
    
    }

   
}

extension TaskListTVC: SaveUserTaskDelegate {
    func saveTask(task: TaskModel) {
        print("extension saveDelegate")
        arrayUserTask.append(task)
        tableView.reloadData()
    }
    
}

extension TaskListTVC: DeleteUserTaskDelegate {
    func deleteTask(task: TaskModel) {
    
        guard let taskByIndex = task.currentIndex?.item else { return }
        arrayUserTask.remove(at: taskByIndex)
        tableView.reloadData()
    }
}

extension TaskListTVC: CompletedUserTaskDelegate {
    func changeColorCell(task: TaskModel) {
        guard let taskByIndex = task.currentIndex?.item else { return }
        arrayUserTask[taskByIndex].taskCellColor = #colorLiteral(red: 0.5316366553, green: 0.7987418771, blue: 0.7543056011, alpha: 1) // это #colorLiteral и выбор цвета на доске - палитре hex - методом введения номера цвета
        tableView.reloadData()
    }
    
    
}
