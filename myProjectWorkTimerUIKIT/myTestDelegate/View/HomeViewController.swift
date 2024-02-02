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
        
       
        
        performSegue(withIdentifier: "HometoMoveSettings", sender: self)
    }
    
    @IBAction func createButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "toListTodoVC", sender: self)
    }
    
    // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toListTodoVC", let vc = segue.destination as? ListTodoVC {
             vc.ToDoDelegate = self
         } else if segue.identifier == "HometoMoveSettings", let vc = segue.destination as? SettingsViewController {
             
         }
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.toDos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorkNameCell", for: indexPath) as? WorkTimerCell else { return UITableViewCell() }
        cell.setNameWork(name: manager.toDos[indexPath.row].name ?? "error")
        cell.buttonTappedHandler = {
            print(self.manager.toDos[indexPath.row].id)
            print(indexPath.row)
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
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









