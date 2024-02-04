//
protocol MyDelegate: AnyObject {
    func createTodoName(name: String)
}

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    private let manager = CoreManager.shared

    @IBOutlet weak var workTableView: UITableView!
    
    @IBOutlet weak var createButton: UIButton!
    
    var nameWorkArr: [WorkTimerCell] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.titleLabel?.text = "Create"
        workTableView.delegate = self
        workTableView.dataSource = self

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        workTableView.reloadData()
    }
   
    
    @IBAction func moveToSettings(_ sender: Any) {
        performSegue(withIdentifier: "HomeToMoveSettings", sender: self)
    }
    
    
    @IBAction func createButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "CreateNewToDoVC", sender: self)
    }
    
    // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         if segue.identifier == "CreateNewToDoVC", let vc = segue.destination as? CreateNewToDoVC {
             print("prepare from HomeVC to Create")
         } else if segue.identifier == "HomeToMoveSettings", let vc = segue.destination as? SettingsViewController {
             print("prepare from HomeVC to Setting")
             
         }
     }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.toDos.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkNameCell", for: indexPath) as? WorkTimerCell else { return UITableViewCell() }
        cell.setNameWork(name: manager.toDos[indexPath.row].name ?? "error")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
        vc.toDo = SettingsViewController.manager.toDos[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeViewController: MyDelegate {
    func createTodoName(name: String) {
        let nameWorkItem = WorkTimerCell()
        nameWorkItem.name = name
        nameWorkArr.append(nameWorkItem)
        workTableView.reloadData()
    }
    
    
}









