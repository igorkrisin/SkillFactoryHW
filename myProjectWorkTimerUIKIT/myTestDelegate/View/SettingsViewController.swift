//
//  SettingsViewController.swift
//  myTestDelegate
//
//  Created by Игорь Крысин on 28.01.2024.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static let manager = CoreManager.shared
    var toDo: Todo?
    
    @IBOutlet weak var tableSettingView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableSettingView.dataSource = self
        tableSettingView.delegate = self
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "cross"), style: .plain, target: self, action: #selector(backToHomeScreen))
        backBarButton.stileForUIBarButton(button: backBarButton)
        navigationItem.leftBarButtonItem = backBarButton
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableSettingView.reloadData()
    }
   
    
    @objc func backToHomeScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsViewController.manager.toDos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else { return UITableViewCell() }
        
        cell.nameToDo.text = SettingsViewController.manager.toDos[indexPath.row].name ?? "error"
        
        //delete for button
        cell.callback = {cell in
            let indexPath = tableView.indexPath(for: cell)!
            let todo = SettingsViewController.manager.toDos[indexPath.row]
            todo.deleteTodo()
            SettingsViewController.manager.toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CreateNewToDoVC") as? CreateNewToDoVC else { return }
        vc.todo = SettingsViewController.manager.toDos[indexPath.row]
        vc.dataTextfield = SettingsViewController.manager.toDos[indexPath.row].name ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //delete for swap
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todo = SettingsViewController.manager.toDos[indexPath.row]
            todo.deleteTodo()
            SettingsViewController.manager.toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
}


