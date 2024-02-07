//
//  Delegates.swift
//  ToDo list
//
//  Created by Игорь Крысин on 04.01.2024.
//

import Foundation


protocol SaveUserTaskDelegate: AnyObject {
    func saveTask(task: TaskModel)
}

protocol DeleteUserTaskDelegate: AnyObject {
    func deleteTask(task: TaskModel)
}

protocol CompletedUserTaskDelegate: AnyObject {
    func changeColorCell(task: TaskModel)
}
